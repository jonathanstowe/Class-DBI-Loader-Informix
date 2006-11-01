#!/usr/bin/perl
use strict;
use Test::More;
eval "use Test::Pod::Coverage tests => 2";
plan skip_all => "Test::Pod::Coverage required for testing POD Coverage" if $@;
pod_coverage_ok( "Class::DBI::Informix", {also_private => [ qr/constant/]},
                  "Class::DBI::Informix is covered" );
pod_coverage_ok( "Class::DBI::Loader::Informix", {also_private => [ qr/constant/]},
                  "Class::DBI::Loader::Informix is covered" );
 

