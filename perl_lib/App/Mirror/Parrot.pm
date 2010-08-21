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

    say "Finding local tags...";
    my (@local_tags)    = grep { m!tags/! } qx( git branch -r );

    say "Finding svn tags...";
    my (@tags)          = map { chomp; $_ =~ s%/$%%g; $_ } qx( svn ls https://svn.parrot.org/parrot/tags );

    say "Finding svn branches...";
    my (@svn_branches)  = map { chomp; $_ =~ s%/$%%g; $_ } qx( svn ls https://svn.parrot.org/parrot/branches );

    my (@goners)       = (set(@local_branches) - set(@svn_branches))->members;

    say "Found " . scalar(@svn_branches) . " current svn branches on server";
    say "Subversion branches: @svn_branches" if $self->verbose;
    say "Found " . scalar(@local_branches) . " historical svn branches in git svn metadata";
    say "Local subversion branches: @svn_branches" if $self->verbose;

    say "Going to delete: @goners";

    $self->update_master();
    $self->update_branches(@svn_branches);
    $self->remove_remote_branches(@goners) if $self->remove_remote;
    $self->remove_local_branches(@goners) if $self->remove_local;
    $self->push_tags() if $self->tags;
    return 0;
}
sub push_tags {
    my ($self, @tags) = @_;
    say "Pushing " . scalar(@tags) . " tags";
    say "Tags : @tags" if $self->verbose;
    for my $tag (@tags) {
        $self->run_command("git push " . $self->remote . " $tag");
    }
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
