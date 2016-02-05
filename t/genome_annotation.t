#!perl -T

use Test::More;
use Test::Exception;

#plan skip_all => 'not ready yet';
#exit(0);

use DOEKBase::DataAPI::annotation::genome_annotation::ClientAPI;

my $url='http://localhost:9103';
my $token=$ENV{'KB_AUTH_TOKEN'};
my $ref='ReferenceGenomeAnnotations/kb|g.166819';
my $badref='ReferenceGenomeAnnotations/kb|g.000000';

my @functions = qw(
get_taxon
get_assembly
get_feature_types
get_feature_type_descriptions
get_feature_type_counts
get_proteins
get_feature_ids
get_features
get_feature_locations
get_feature_dna
get_feature_functions
get_feature_aliases
get_feature_publications
);

my @feature_functions = qw(
get_mrna_by_cds
get_cds_by_mrna
get_gene_by_cds
get_gene_by_mrna
get_cds_by_gene
get_mrna_by_gene
);

#### TODO: split out tests by cds, mrna, gene (see bin/annotation_client_driver.pl)
#### test filtering for get_feature_ids

plan tests => 2 * (scalar(@functions) + scalar(@feature_functions) + 1);

my $api = new_ok(DOEKBase::DataAPI::annotation::genome_annotation::ClientAPI=>[{url=>$url,token=>$token,ref=>$ref}]);
my $badapi = new_ok(DOEKBase::DataAPI::annotation::genome_annotation::ClientAPI=>[{url=>$url,token=>$token,ref=>$badref}]);

my $feature_ids = ['kb|g.166819.CDS.6671', 'kb|g.166819.CDS.202', 'kb|g.166819.CDS.203'];

foreach my $function (@feature_functions)
{
    ok($result = $api->$function($feature_ids), "$function goodref" );
    dies_ok { $result = $badapi->$function($feature_ids) } "$function badref" ;
}

foreach my $function (@functions)
{
    ok($result = $api->$function(), "$function goodref" );
    dies_ok { $result = $badapi->$function() } "$function badref" ;
}


