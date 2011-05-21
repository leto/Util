#!/usr/bin/env perl

use strict;
use warnings;
use Geo::KML;
use Data::Dumper;

# This file will dump markers from a KML 2.2 file as CSV in Name, Lat, Lng format

my $file = shift || die "Usage: $0 file.kml > file.csv";
my $data = Geo::KML->readKML($file);

$Data::Dumper::Indent = 1;
my $places = $data->{Document}->{AbstractFeatureGroup};
for my $place ( @$places) {
    my $placemark   = $place->{Placemark};
    # warn Dumper $placemark;
    my ($lat,$long) = split /,/, $placemark->{Point}->{coordinates}->[0];
    my $name        = $placemark->{name};
    print "$name, $lat, $long\n";
}
