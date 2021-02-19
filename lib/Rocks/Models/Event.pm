package Rocks::Models::Event;

use v5.26;
use Moo;
use Types::Standard qw[Str ArrayRef InstanceOf];
use Type::Params qw[compile];
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has name => ( is => "ro", isa => Str );
has presents => ( is => "ro", isa => ArrayRef[InstanceOf["Rocks::Models::Presentation"]] );

sub from_record ($class, $record)
{
    $class->new(%$record);
}

sub add_present
{
    state $check = compile(InstanceOf["Rocks::Models::Present"]);
    my $self = shift;
    my ($present) = $check->(@_);
}

1;
