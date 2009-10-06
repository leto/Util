#!/usr/bin/perl5.10 -w

use strict;
use Class::Sniff;
use Carp qw/croak/;
use Data::Dumper;

my @packages = @ARGV;

croak "Usage: $0 Some::Module And::Another" unless @packages;
my @sniffs = map {
    my $package = $_;
    eval "use $package";
    warn $@ if $@;
    Class::Sniff->new({ class => $package });
} @packages;
die Dumper [ @sniffs ];
my $sniff = shift @sniffs;


my $graph = $sniff->combine_graphs(@sniffs);
warn Dumper $graph;

my $graphviz = $graph->as_graphviz;
print $graphviz;
open my $DOT, '|dot -Tpng -o graph.png' or die("Cannot open pipe to dot: $!");
print $DOT $graphviz;



