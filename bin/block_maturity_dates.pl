#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);
use JSON;

chomp(my $host = `hostname`);
my $num_blocks = int( shift || 1000 );
my $output     = qx{./fiat/verus listtransactions "" $num_blocks};
#my $output     = qx{./fiat/verus listtransactions "" $blocks}; # |grep blockstomaturity | cut -d: -f2 | sed 's/,//g' | sort -n};
my $blocks     = decode_json($output);
print "$host:\n";
my $num = 0;
my $total = 0;
my @blocks = sort { $a->{blockstomaturity} <=> $b->{blockstomaturity} } grep { defined $_->{blockstomaturity} } @$blocks;
for my $block (@blocks) {
    next unless $block->{category} eq 'immature';
    $num++;
    my $amount           = $block->{amount};
    my $blockstomaturity = $block->{blockstomaturity};
    my $date = strftime "%a %b %e %H:%M:00 %Y", localtime(time + 60*$blockstomaturity);
    printf "%02d %s, %d\n", $num, $date, $amount;
    $total += $amount;
}

#for my $line (@lines) {
#    chomp $line;
#    # my $date = localtime(time + 60*$line);
#    my $date = strftime "%a %b %e %H:%M:00 %Y", localtime(time + 60*$line);
#    print "$num $date\n";
#}

print "Total: $num immature blocks, $total VRSC\n";
