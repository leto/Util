#!/usr/bin/perl

use strict;
use autodie;
use Data::Dumper;
my ($find,$replace,@files) = @ARGV;

usage() unless $find && defined $replace;
unless( @files ) {
    printf "No files to replace stuff!";
    exit 0;
}

my $fh;
print "Going to replace $find with $replace in " . scalar(@files) . " files\n";

for my $file (@files) {
    if (-d $file) {
        printf "Skipping directory $file\n";
        next;
    }
    unless ( -e $file ) {
        printf "$file does not exist!\n";
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
