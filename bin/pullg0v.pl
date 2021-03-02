#!/usr/bin/env -S perl -w -Ilib

use 5.026;
use utf8;
use open IO => ":locale";
use strict;
use warnings;

use Rocks::Sources::GoogleSpreadsheet;

use YAML::Dumper;

my $dumper = YAML::Dumper->new;

my $g0v = Rocks::Sources::GoogleSpreadsheet->new;
my %objects = $g0v->pull;
print $dumper->dump(\%objects);

0;
