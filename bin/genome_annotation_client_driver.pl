#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use Data::Dumper;
use Time::HiRes qw( time );

# Local
#use annotation::genome_annotation::ClientAPI;
use DOEKBase::DataAPI::annotation::genome_annotation::ClientAPI;

sub test_client {
    my ($url,$token,$ref) = @_;
    warn "Using URL $url and reference $ref";
    my $api = DOEKBase::DataAPI::annotation::genome_annotation::ClientAPI->new({url=>$url,token=>$token,ref=>$ref});

    warn "Getting data..";

    my @generic_functions = qw(
get_taxon
get_feature_types
get_feature_type_descriptions
get_feature_type_counts
get_proteins
get_feature_ids
get_assembly
);

    my @cds_functions = qw(
get_features
get_feature_dna
get_feature_locations
get_feature_functions
get_feature_aliases
get_feature_publications
get_mrna_by_cds
get_gene_by_cds
);

    my @mrna_functions=qw(
get_cds_by_mrna
get_gene_by_mrna
);

    my @gene_functions=qw(
get_cds_by_gene
get_mrna_by_gene
);

    foreach my $function (@generic_functions)
    {
        my $start_time=time();
        my $result = $api->$function();
        my $elapsed_time=time()-$start_time;
        warn Dumper($result);
        warn "Got and parsed data from $function in $elapsed_time seconds";
    }

##### TODO: test filters for get_feature_ids (see https://kbase.github.io/docs-ghpages/docs/data_api/annotation_api.html)

    my $all_cds_ids = $api->get_feature_ids(filters=>{type_list=>['CDS']});
    my $all_mrna_ids = $api->get_feature_ids(filters=>{type_list=>['mRNA']});
    my $all_gene_ids = $api->get_feature_ids(filters=>{type_list=>['gene']});
#    my $all_feature_ids = $api->get_feature_ids();
    my @cds_ids = @{$all_cds_ids->{'by_type'}{'CDS'}}[0,1,2];
    my @mrna_ids = @{$all_mrna_ids->{'by_type'}{'mRNA'}}[0,1,2];
    my @gene_ids = @{$all_gene_ids->{'by_type'}{'gene'}}[0,1,2];

    foreach my $function (@cds_functions)
    {
        my $start_time=time();
        my $result = $api->$function(\@cds_ids);
        my $elapsed_time=time()-$start_time;
        warn Dumper($result);
        warn "Got and parsed data from $function in $elapsed_time seconds";
    }

    foreach my $function (@mrna_functions)
    {
        my $start_time=time();
        my $result = $api->$function(\@mrna_ids);
        my $elapsed_time=time()-$start_time;
        warn Dumper($result);
        warn "Got and parsed data from $function in $elapsed_time seconds";
    }

    foreach my $function (@gene_functions)
    {
        my $start_time=time();
        my $result = $api->$function(\@gene_ids);
        my $elapsed_time=time()-$start_time;
        warn Dumper($result);
        warn "Got and parsed data from $function in $elapsed_time seconds";
    }

}

#my $url='http://localhost:9103';
my $url='https://ci.kbase.us/services/data/annotation';
my $token=$ENV{'KB_AUTH_TOKEN'};
my $ref='ReferenceGenomeAnnotations/kb|g.166819';

GetOptions (
    'url=s' => \$url,
    'token=s' => \$token,
    'ref=s' => \$ref,
);

#ap = argparse.ArgumentParser()
#ap.add_argument('--ref', default='PrototypeReferenceGenomes/kb|g.166819_assembly', help='Object reference ID, e.g. 1019/4/1')
#ap.add_argument('--url', dest='url', default='http://localhost:9102',
#                metavar='URL', help='Remote server url '
#                                     '(default=%(default)s)')
#args = ap.parse_args()

test_client($url,$token,$ref);

