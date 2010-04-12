#!/usr/bin/perl

use strict;
use autodie;
use 5.010;
use Data::Dumper;
my ($find,$replace,@files) = @ARGV;

usage() unless $find && defined $replace;
unless( @files ) {
    say "No files to replace stuff!";
    exit 0;
}

my $fh;
say "Going to replace $find with $replace in " . scalar(@files) . " files";

for my $file (@files) {
    if (-d $file) {
        say "Skipping directory $file";
        next;
    }
    unless ( -e $file ) {
        say "$file does not exist!";
        next;
    }
    open $fh, '<', $file;
    my $content = join('',<$fh>);
    $content =~ s/\Q$find\E/$replace/g;
    close $fh;

    open $fh, '>', $file;
    print $fh $content;
    close $fh;
}

sub usage {
    die "$0 stringtofind stringtoreplace file [more files...]\n";
}
