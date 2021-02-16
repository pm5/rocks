package Rocks::Models::Event;

use Moo;
use Types::Standard qw[Str];
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has name => ( is => "ro", isa => Str );

sub from_record ($class, $record)
{
    $class->new(%$record);
}

sub presents ($self) { }

1;
