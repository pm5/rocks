package Rocks::Base;

use strict;
use warnings;
no warnings qw[experimental::signatures];
use utf8;
use open IO => ":locale";
use feature qw[:5.30 signatures];

sub import {
    strict->import;
    warnings->import;
    warnings->unimport(qw[experimental::signatures]);
    feature->import(qw[:5.30 signatures]);
}

1;
