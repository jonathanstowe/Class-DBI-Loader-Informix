#!/usr/bin/perl -w

use strict;
use Test::More tests => 4;

use DBI;
use Class::DBI::Loader;

my ($datasource) = grep /stores/,  DBI->data_sources('Informix');

SKIP:
{
   skip "No stores database to test against" unless $datasource;

   my $loader;
   eval
   { 
      $loader = Class::DBI::Loader->new(
                                         dsn => $datasource,
                                         user => '',
                                         password => '',
                                         relationships => 1,
                                         namespace => 'Stores',
                                         exclude => 'msg',
                                        );
   };

   ok(!$@,"Load and analyze DB");

   my $class;

   eval
   {
      $class = $loader->find_class('customer');
   };
   ok(!$@,'find customer class');

   my @customers;
   ok(@customers = $class->retrieve_all(),'Retrieve customers');
   ok(($customers[0]->order())[0],"Retrieve an order");
}
