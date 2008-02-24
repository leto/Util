#!/usr/bin/perl -w
use strict;
use Math::MatrixReal;
# Example code to show type bound operator overloading 
# that returns the same stuff

my $matrix = Math::MatrixReal->new_from_rows([[3,6,9]]);
my $a = (2/3) * $matrix;
my $b = 2 * $matrix / 3;

print "\$a is a " . (ref $a) . "\n";
print "\$b is a " . (ref $b) . "\n";
print "\$a=\n";
print $a;
print "\$b=\n";
print $b;
