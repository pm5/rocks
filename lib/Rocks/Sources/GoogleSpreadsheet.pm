package Rocks::Sources::GoogleSpreadsheet;

use Moo;
use Types::Standard qw[Str];

has url => ( is => "ro", isa => Str );

sub pull {}
sub push {}

1;
