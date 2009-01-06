package Leto::Util::Web::Test;

use base q{Test::Class};
use Leto::Util::Web qw/is_search_request/;

use Test::More tests => 9;
use Data::Dumper;
use strict;

sub make_fixture : Test(setup) { }

sub teardown : Test(teardown) { }

sub IS_SEARCH_REQUEST : Tests(9)
{
    my $r = 'http://www.google.com/search?q=determine+search+engine+request&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a';
    ok( is_search_request($r), 'google' );

    $r = '';
    ok(!is_search_request($r), 'no referrer is not search' );

    $r = 'http://leto.net';
    ok(!is_search_request($r), 'leto.net is not search' );

    $r = 'http://search.yahoo.com/search?ei=utf-8&fr=slv8-hpd05&p=virtual%20downconversion%20mods&type=';
    ok( is_search_request($r), 'yahoo' );

    $r = 'http://search.live.com/results.aspx?q=factor';
    ok( is_search_request($r), 'live' );

    $r = 'http://www.facebook.com/profile.php?id=697737500&ref=nf';
    ok(!is_search_request($r), 'fb aint search' );

    $r = 'http://images.google.com/imgres?imgurl=http://ucfmap.com/blog/wp-content/uploads/2007/08/ucf_arena_air.jpg&imgrefurl=http://ucfmap.com/blog/2007/08/30/aerial-picture-of-the-arena/ucf-arena-aerial-view/&usg=__O5k6OKPS1RZbJiRD-HH-jF3X890=&h=315&w=500&sz=102&hl=en&start=9&tbnid=ZsBtDjgoUY9jaM:&tbnh=82&tbnw=130&prev=/images%3Fq%3Ducf%26gbv%3D2%26hl%3Den%26safe%3Doff';
    ok( is_search_request($r), 'google images' );
    

    $r = 'http://search.aol.com/aol/search?invocationType=comsearch40&query=alexander+babcock+winter+park&do=Search';

    ok( is_search_request($r), 'aol' );

    $r = 'http://search.rr.com/search?source=image&qs=ucf&lr=&safe=&channelId=RR_tampa_centralfl_brighthouse&clientId=aol-rr';

    ok( is_search_request($r), 'aol rr' );
}

Test::Class->runtests;
