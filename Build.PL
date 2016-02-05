
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "Devel::Cover" => 0,
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "DOE KBase Data API Perl clients",
  "dist_author" => [
    "KBase <help\@kbase.us>"
  ],
  "dist_name" => "DOEKBaseDataAPI",
  "dist_version" => "0.0.1",
  "license" => "mit",
  "module_name" => "DOEKBase::DataAPI",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Thrift" => 0,
    "Try::Tiny" => 0,
    "Class::Accessor" => 0,
    "LWP::Protocol::https" => 0,
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
