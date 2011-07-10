#!/usr/bin/env perl

use strict;
use warnings;
use Test::WWW::Mechanize;
use Test::Most;
use Data::Dumper;

my $m = Test::WWW::Mechanize->new;
my $url = shift || die "Usage: $0 URL";

$m->get_ok($url);
my @links = $m->links;

my @local_links  = grep { $_->url !~ m/:/} @links;
my @remote_links = grep { $_->url =~ m/:/ } @links;

# only checks remote links currently
map { $m->get_ok($_) } @remote_links;

