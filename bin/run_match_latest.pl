#!/usr/bin/perl -w

# Run a given program on the newest non-directory in a given directory

use strict;
$|++;
my $program = shift || die "Must give program to run with latest file";
my $dir = shift || './';

opendir (my $d, $dir) or die $!;

my @files = sort { -M $b <=> -M $a } grep { !-d $_ } readdir ($d);
print "Running: $program " . $files[-1] . "\n";
system($program, $files[-1]);
closedir ($d);
