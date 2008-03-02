#!/usr/bin/perl -w 

use strict;
use warnings;

# Why does this produce a warning *and* the expected behavior?

# Useless use of private variable in void context at ./spurious_perl_error.pl line 8.
# woohoo!

my ($x,$y) = (3,4);

if ( ($x,$y) == pair() ) {
    print "woohoo!\n";
}
sub pair { return (3,4) };

