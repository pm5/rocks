package Rocks::Models::Present;

use Moo;
use Types::Standard qw[Str InstanceOf];
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has event => ( is => "ro", isa => InstanceOf["Rocks::Models::Event"] );

1;
