package Rocks::Models::Event;

use v5.26;
use Moo;
use Types::Standard qw[Str ArrayRef InstanceOf];
use Type::Params qw[compile];
use DateTime;
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has happened_at => ( is => "ro", isa => InstanceOf["DateTime"] );
has name => ( is => "ro", isa => Str );

has presentations => ( is => "ro", isa => ArrayRef[InstanceOf["Rocks::Models::Presentation"]] );

sub from_record ($class, $record)
{
    $class->new(%$record);
}

sub add_presentation
{
    state $check = compile(InstanceOf["Rocks::Models::Presentation"]);
    my $self = shift;
    my ($pres) = $check->(@_);
    die "did not pass constraints" unless $pres->event == $self;

    push @{$self->{presentations}}, $pres;
}

1;
