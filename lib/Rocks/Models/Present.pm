package Rocks::Models::Present;

use v5.26;
use Moo;
use Types::Standard qw[Str InstanceOf];
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has slides => ( is => "ro", isa => Str );
has video => ( is => "ro", isa => Str );
has event => ( is => "ro", isa => InstanceOf["Rocks::Models::Event"] );
has project => ( is => "ro", isa => InstanceOf["Rocks::Models::Project"] );

1;
