#!/usr/bin/perl -w

use Math::MatrixReal;
use Benchmark;
do 'funcs.pl';
my $matrix1 = Math::MatrixReal->new_random(10);
my $matrix2 = $matrix1->new_random(5);

my @matrices = map { Math::MatrixReal->new_random($_) } qw(5 10 15 20);

my $iter = 1000;

for my $matrix ( @matrices ) {
        my ($r,$c) = $matrix->dim;
        print "Benchmarking $r x $c matrix\n";

        timethese($iter,
            { 
              'matrix_squared     '     => sub { $matrix ** 2 },
              'matrix_times_itself'	    => sub { $matrix * $matrix },
              'det                '     => sub { $matrix->det },
              'det_LR             '     => sub { $matrix->decompose_LR->det_LR },
              'inverse            '     => sub { $matrix->inverse() },
              'to_negative_one    '     => sub { $matrix ** -1 },
              'invert_LR          '     => sub { $matrix->decompose_LR->invert_LR },
            });

}
