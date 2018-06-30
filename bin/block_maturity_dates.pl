#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);

my $output = qx{./fiat/verus listtransactions "" 1000 |grep blockstomaturity | cut -d: -f2 | sed 's/,//g' | sort -n};
my @lines  = split /\n/, $output;

chomp(my $host = `hostname`);
print "$host:\n";
my $num = 0;
for my $line (@lines) {
    $num++;
    chomp $line;
    # my $date = localtime(time + 60*$line);
    my $date = strftime "%a %b %e %H:%M:00 %Y", localtime(time + 60*$line);
    print "$num $date\n";
}

print "Total: $num immature blocks\n";
