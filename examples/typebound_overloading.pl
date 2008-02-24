#!/usr/bin/perl -w
use strict;
use Math::MatrixReal;
# Example code to show type bound operator overloading 
# that returns the same stuff

my $matrix = Math::MatrixReal->new_from_rows([[3,6,9]]);
my $a = (2/3) * $matrix;
my $b = 2 * $matrix / 3;
my $c = 2 * (+$matrix) / 3;
my $d = (2/3) * (+$matrix);


print "\$a is a " . (ref $a) . "\n";
print "\$b is a " . (ref $b) . "\n";
print "\$c is a " . (ref $c) . "\n";
print "\$d is a " . (ref $d) . "\n";
print "\$a=\n";
print $a;
print "\$b=\n";
print $b;
print "\$c=\n";
print $c;
print "\$d=\n";
print $d;

