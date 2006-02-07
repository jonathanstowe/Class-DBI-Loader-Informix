#!/usr/bin/perl -w

use strict;

use DBI;

use Test::More tests => 1;

use Class::DBI::Loader::Informix;

my $datasource = ( DBI->data_sources('Informix'))[0];

SKIP:
{
   skip "No datasources for test" unless defined $datasource;

   ok(Class::DBI::Loader::Informix::_tables({_datasource => [$datasource]}),
      "_tables functions correctly");
}
