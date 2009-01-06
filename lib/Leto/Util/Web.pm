package Leto::Util::Web;
use strict;
use base 'Exporter';

our @EXPORT_OK = qw/ is_search_request /;
our @EXPORT    = qw//;


sub is_search_request($)
{
    my $r = shift;
    my @engines = qw{ 
                    /search\? 
                    images\.google
                    search\.yahoo\.com
                    msn\.com 
                    live\.com
                    del\.icio\.us/search
                };

    for my $eng (@engines){
        return 1 if $r =~ m/$eng/i;
    }
    return 0;
}

5;
