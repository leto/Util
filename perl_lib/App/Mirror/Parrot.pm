package App::Mirror::Parrot;
use Moose;
use JSON::Any;
use LWP::Simple;
with 'MooseX::Runnable';
with 'MooseX::Getopt';
use autodie qw(:all);
use 5.010;
use Set::Object qw/set/;
local $| = 1;
use Data::Dumper;

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
has new_tags => (
    is      => 'rw',
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

has github_url => (
    is      => 'ro',
    default => 'http://github.com/api/v2/json/repos/show/parrot/parrot/',
    isa     => 'Str',
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

    my $j = JSON::Any->new;
    my $github_branches = $j->decode( get($self->github_url . "branches") )->{branches};
    my $github_tags     = $j->decode( get($self->github_url . "tags") )->{tags};

    say "Finding svn tags...";
    # this will find RELEASE_*, REL_* and PRE_REL_*, and V1, the initial svn commit
    my (@svn_tags)      = grep { m!(^V1)|(REL)! } map { chomp; $_ =~ s%/$%%g; $_ } qx( svn ls https://svn.parrot.org/parrot/tags );

    say "Finding svn branches...";
    my (@svn_branches)    = map { chomp; $_ =~ s%/$%%g; $_ } qx( svn ls https://svn.parrot.org/parrot/branches );
    my (@zombie_branches) = grep { $_ !~ m/^master$/ } (set(keys %$github_branches) - set(@svn_branches))->members;
    my (@new_tags)        = (set(@svn_tags) - set(keys %$github_tags))->members;

    $self->new_tags(1) if @new_tags;

    say "Found " . scalar(@svn_branches) . " current svn branches on server";
    say "Subversion branches: @svn_branches" if $self->verbose;
    say "Found " . scalar(@local_branches) . " historical svn branches in git svn metadata";
    say "Local subversion branches: @svn_branches" if $self->verbose;
    say "Going to delete " . scalar(@zombie_branches) . " zombie branches";
    say "Zombie branches: @zombie_branches" if @zombie_branches and ($self->remove_remote or $self->remove_local);

    $self->update_master();
    $self->update_branches(@svn_branches)  if $self->branches;
    $self->remove_remote_branches(@zombie_branches) if $self->remove_remote;
    $self->remove_local_branches(@zombie_branches)  if $self->remove_local;
    $self->push_tags(@new_tags) if $self->tags;
    return 0;
}
sub push_tags {
    my ($self, @tags) = @_;
    say "Pushing " . scalar(@tags) . " tags";
    say "Tags : @tags" if $self->verbose and @tags;
    for my $tag (@tags) {
        chomp( my $commit    = qx(git rev-parse refs/remotes/svn/tags/$tag) );
        chomp( my $mergebase = qx(git merge-base refs/remotes/svn/trunk $commit | head -n1) );
        chomp( my $name      = qx(git show --pretty='format:%an' $commit | head -n1 ) );
        chomp( my $date      = qx(git show --pretty='format:%ad' $commit | head -n1 ) );
        my $env       = "GIT_COMMITTER_NAME='$name' GIT_COMMITTER_DATE='$date'";
        # say "$tag -> $commit ( merge base = $mergebase )";
        $self->run_command("$env git tag $tag $mergebase");
    }
    $self->run_command("git push --tags") if $self->new_tags;
}

sub remove_remote_branches {
    my ($self, @goners) = @_;
    say "Removing old branches from remote" if @goners;
    for my $branch (sort @goners) {
        $self->run_command("git push " . $self->remote . " :$branch");
    }
}
sub remove_local_branches {
    my ($self, @goners) = @_;
    say "Removing old branches locally" if @goners;
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
