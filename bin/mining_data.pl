#!/usr/bin/env perl
use strict;
use warnings;
use JSON;
use Data::Dumper;

print "# time, nethash_5min, nethash_1hr, difficulty, localhash, luck_days_5min, luck_days_1hr\n";

while (1) {
    mining_data();
    sleep(10);
}

sub nethash {
    my ($blocks) = @_;
    my $cmd      = "./fiat/verus getnetworkhashps $blocks";
    my $nethash  = qx{$cmd};
    chomp $nethash;
    return $nethash;
}

sub mining_data {
    my $cmd         = './fiat/verus getmininginfo';
    my $json        = qx{$cmd};
    my $info        = decode_json($json);
    my $diff        = $info->{difficulty}; # warn Dumper $info;
    # this is a 5 block (5min) moving average
    my $nethash5    = nethash(5);
    # this is a 60 block (1hr) moving average
    my $nethash60   = nethash(60);
    my $localhash   = $info->{localhashps};
    my $time        = time;
    my $luck_days5  = $nethash5 / $localhash / 1440;
    my $luck_days60 = $nethash60 / $localhash / 1440;

    print "$time, $nethash5, $nethash60, $diff, $localhash, $luck_days5, $luck_days60\n";
}

