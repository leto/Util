#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);
use JSON;

my $rescan     = shift || "true";
my $num_blocks = int( shift || 1000 );
my $output     = qx{./fiat/verus listtransactions "" $num_blocks};
my $blocks     = decode_json($output);
for my $block (@$blocks) {
    next unless $block->{category} eq 'immature';
    my $address = $block->{address};
    chomp(my $privkey = qx{./fiat/verus dumpprivkey $address});
    # print the commands to import these keys into another node
    print qq{./fiat/verus importprivkey $privkey "" $rescan # $address \n};
}

