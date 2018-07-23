#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);
use JSON;

my $cli    = shift || "komodo-cli";
my $rescan = shift || "true";
my $output = qx{$cli getaddressesbyaccount ""};
my $addrs  = decode_json($output);

# Print a bash script that you can use to import privkeys on another node
# DO NOT LEAVE THIS LYING AROUND WHERE OTHER CAN FIND IT
print "#!/bin/bash\n";
for my $address (@$addrs) {
    chomp(my $privkey = qx{./fiat/verus dumpprivkey $address});
    # print the commands to import these keys into another node
    print qq{./fiat/verus importprivkey $privkey "" $rescan # $address \n};
}

