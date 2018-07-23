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
# NOTES:
# DO NOT LEAVE THIS LYING AROUND WHERE OTHER CAN FIND IT
# You can use this even if your server is resyncing/scanning
print "#!/bin/bash\n";
for my $address (@$addrs) {
    chomp(my $privkey = qx{$cli dumpprivkey $address});
    # print the commands to import these keys into another node
    print qq{$cli importprivkey $privkey "" $rescan # $address \n};
}

