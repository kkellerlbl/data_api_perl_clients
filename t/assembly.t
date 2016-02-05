#!perl -T

use Test::More;
use Test::Exception;

#plan skip_all => 'not ready yet';
#exit(0);

use DOEKBase::DataAPI::sequence::assembly::ClientAPI;

my $url='http://localhost:9102';
my $token=$ENV{'KB_AUTH_TOKEN'};
my $ref='ReferenceGenomeAnnotations/kb|g.166819_assembly';
my $badref='ReferenceGenomeAnnotations/kb|g.000000_assembly';

my @functions = qw(
get_assembly_id
get_external_source_info
get_stats
get_number_contigs
get_gc_content
get_dna_size
get_contig_ids
get_contig_lengths
get_contig_gc_content
get_contigs
get_genome_annotations
);

plan tests => 2 * (scalar(@functions) + 1);

my $api = new_ok(DOEKBase::DataAPI::sequence::assembly::ClientAPI=>[{url=>$url,token=>$token,ref=>$ref}]);
my $badapi = new_ok(DOEKBase::DataAPI::sequence::assembly::ClientAPI=>[{url=>$url,token=>$token,ref=>$badref}]);

foreach my $function (@functions)
{
    ok($result = $api->$function(), "$function goodref" );
    dies_ok { $result = $badapi->$function() } "$function badref" ;
}

