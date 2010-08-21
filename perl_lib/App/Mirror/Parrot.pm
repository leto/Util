package App::Mirror::Parrot;
use Moose;
with 'MooseX::Runnable';
with 'MooseX::Getopt';
use autodie qw(:all);
use 5.010;
use Set::Object qw/set/;
$|++;

has logfile => (
    is      => 'ro',
    default => 'mirror_parrot.log',
    isa     => 'Str'
);
has remote => (
    is      => 'ro',
    default => 'origin',
    isa     => 'Str'
);
has dryrun => (
    is      => 'ro',
    default => 0,
    isa     => 'Bool',
);
has tags => (
    is      => 'ro',
    default => 0,
    isa     => 'Bool',
);
has verbose => (
    is      => 'ro',
    default => 0,
    isa     => 'Bool',
);
has remove_remote => (
    is      => 'ro',
    default => 0,
    isa     => 'Bool',
);
has remove_local => (
    is      => 'ro',
    default => 0,
    isa     => 'Bool',
);
has branches => (
    is      => 'ro',
    default => 0,
    isa     => 'Bool',
);

sub BUILDARGS {
    my $class = shift;
    my %args = @_;
    return $class->SUPER::BUILDARGS( %args );
}

sub check_sanity() {
    die "Must be run from a git repo!" unless -e '.git';
}

sub run {
    my ($self, %args) = @_;
    check_sanity();

    say "Finding local branches...";
    my (@local_branches) = map { $_ =~ s!\.git/svn/refs/remotes/svn/!!; $_ } glob ".git/svn/refs/remotes/svn/*";

    say "Finding svn tags...";
    # this will find RELEASE_*, REL_* and PRE_REL_*
    my (@svn_tags)      = grep { m!REL! } map { chomp; $_ =~ s%/$%%g; $_ } qx( svn ls https://svn.parrot.org/parrot/tags );

    # need to look at difference of github tags and svn tags and only push those

    say "Finding svn branches...";
    my (@svn_branches)  = map { chomp; $_ =~ s%/$%%g; $_ } qx( svn ls https://svn.parrot.org/parrot/branches );

    my (@goners)       = (set(@local_branches) - set(@svn_branches))->members;

    say "Found " . scalar(@svn_branches) . " current svn branches on server";
    say "Subversion branches: @svn_branches" if $self->verbose;
    say "Found " . scalar(@local_branches) . " historical svn branches in git svn metadata";
    say "Local subversion branches: @svn_branches" if $self->verbose;


    # need to look at difference of github branches and svn branches and
    # delete github branches that no longer exist in svn
    say "Going to delete " . scalar(@goners);
    say "Goners: @goners" if $self->remove_remote or $self->remove_local;

    $self->update_master();
    $self->update_branches(@svn_branches)  if $self->branches;
    $self->remove_remote_branches(@goners) if $self->remove_remote;
    $self->remove_local_branches(@goners)  if $self->remove_local;
    $self->push_tags(@svn_tags) if $self->tags;
    return 0;
}
sub push_tags {
    my ($self, @tags) = @_;
    say "Pushing " . scalar(@tags) . " tags";
    say "Tags : @tags" if $self->verbose;
    for my $tag (@tags) {
        chomp( my $commit    = qx(git rev-parse refs/remotes/svn/tags/$tag) );
        chomp( my $mergebase = qx(git merge-base refs/remotes/svn/trunk $commit | head -n1) );
        chomp( my $name      = qx(git show --pretty='format:%an' $commit | head -n1 ) );
        chomp( my $date      = qx(git show --pretty='format:%ad' $commit | head -n1 ) );
        my $env       = "GIT_COMMITTER_NAME='$name' GIT_COMMITTER_DATE='$date'";
        # say "$tag -> $commit ( merge base = $mergebase )";
        $self->run_command("$env git tag $tag $mergebase");
    }
    $self->run_command("git push --tags");
}

sub remove_remote_branches {
    my ($self, @goners) = @_;
    say "Removing old branches from remote";
    for my $branch (sort @goners) {
        $self->run_command("git push " . $self->remote . " :$branch");
    }
}
sub remove_local_branches {
    my ($self, @goners) = @_;
    say "Removing old branches locally";
    for my $branch (sort @goners) {
        $self->run_command("git branch -d svn/$branch");
    }
}

sub update_master {
    my ($self) = @_;
    say "Updating trunk -> master branch";
    $self->run_command("git checkout trunk && git svn rebase");
    $self->run_command("git push " . $self->remote . " trunk:master");
}

sub update_branches {
    my ($self, @svn_branches) = @_;
    say "Fetching other branches";
    $self->run_command("git svn fetch");
    say "Pushing other branches";
    for my $branch (sort @svn_branches) {
        $self->run_command("git push " . $self->remote . " remotes/svn/$branch:refs/heads/$branch");
    }
}

sub run_command {
    my ($self,$cmd) = @_;
    say $cmd;
    system("$cmd 2>&1 >> " . $self->logfile) unless $self->dryrun;
}

1;
