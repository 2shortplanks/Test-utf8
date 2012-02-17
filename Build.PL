use 5.007003;

use Module::Build;
my $build = new Module::Build
(
  module_name    => 'Test::utf8',
  license        => 'perl',
  requires       => {
                      'Test::Builder' => "0.15" ,
                    },
  recommends     => {
                    },
  build_requires => { 'Test::Builder::Tester' => '1.01'
                   },
# can't do this, need to add 'use 5.007003' in there
#  create_makefile_pl => 'traditional',
);
$build->create_build_script;
