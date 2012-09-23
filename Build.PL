use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Author::Leto::Deps', # made up
    license             => 'perl',
    dist_author         => 'Jonathan Leto <jonathan@leto.net>',
    dist_abstract       => 'Misc Utils',
    dist_version        => '0.01',
    include_dirs        => '',
    build_requires => {
        'Test::More'      => 0,
        'Test::Exception' => 0,
    },
    configure_requires => { 'Module::Build' => 0.38 },
    requires => {
        'Modern::Perl'          => 0,
        'Test::Most'            => 0,
        'Test::WWW::Mechanize'  => 0,
        'Class::Sniff'          => 0,
        'WWW::Google::PageRank' => 0,
        'Geo::KML'              => 0,
        'HTML::Entities'        => 0,
    },
    add_to_cleanup      => [ '' ],
    meta_merge     => {
        resources => {
            repository  => 'http://github.com/leto/Util/tree/master'
        },
    },
);

$builder->create_build_script();
print "Have a great day!\n";
