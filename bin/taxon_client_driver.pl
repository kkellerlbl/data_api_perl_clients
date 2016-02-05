#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use Data::Dumper;
use Time::HiRes qw( time );

# Local
use DOEKBase::DataAPI::taxonomy::taxon::ClientAPI;

sub test_client {
    my ($url,$token,$ref) = @_;
    my $api = DOEKBase::DataAPI::taxonomy::taxon::ClientAPI->new({url=>$url,token=>$token,ref=>$ref});

    warn "Using URL $url and reference $ref";
    warn "Getting data..";

    my @functions = qw(
get_info
get_history
get_provenance
get_id
get_name
get_version
get_genetic_code
get_aliases
get_domain
get_kingdom
get_taxonomic_id
get_scientific_lineage
get_scientific_name
get_genome_annotations
get_parent
get_children
);

    foreach my $function (@functions)
    {
        my $start_time=time();
        my $result = $api->$function();
        my $elapsed_time=time()-$start_time;
        warn Dumper($result);
        warn "Got and parsed data from $function in $elapsed_time seconds";
    }

}

#my $url='https://ci.kbase.us/services/data/taxon';
my $url='http://localhost:9101';
my $token=$ENV{'KB_AUTH_TOKEN'};
my $ref='ReferenceTaxons/242159_taxon';

GetOptions (
    'url=s' => \$url,
    'token=s' => \$token,
    'ref=s' => \$ref,
);

test_client($url,$token,$ref);
