use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    license             => 'perl',
    dist_version        => '0',
    dist_name           => "Duke Leto's utilities",
    dist_author         => 'Jonathan Leto <jonathan@leto.net>',
    include_dirs        => '',
    build_requires => {
        'Test::More'      => 0,
        'Test::Exception' => 0,
    },
    requires => {
        'perl'             => '5.10.0',
        'Moose'            => 0,
        'MooseX::Runnable' => 0,
        'MooseX::Getopt'   => 0,
        'Set::Object'      => 0,
        'autodie'          => 0,
    },
    create_makefile_pl  => 'traditional',
    meta_merge     => {
        resources => {
            repository  => 'http://github.com/leto/util/tree/master'
        },
    },
);

$builder->create_build_script();
print "Have a great day!\n";
