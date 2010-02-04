#!/usr/bin/env perl

use strict;
use 5.010;
use Cwd;

my $cwd = getcwd;
my @repos;

for my $dir (<*/>) {
    push @repos, $dir if -e "$dir/.git";
}

for my $repo (@repos) {
    chdir $repo;
    say "Updating remotes for: $repo";
    system("git remote update");
    chdir $cwd;
}

say "No git repos found" unless @repos;
