#!perl -T

use Test::More;

BEGIN {
    use_ok('DOEKBase::DataAPI::sequence::assembly::ClientAPI');
    use_ok('DOEKBase::DataAPI::annotation::genome_annotation::ClientAPI');
    use_ok('DOEKBase::DataAPI::taxonomy::taxon::ClientAPI');
}

done_testing;
