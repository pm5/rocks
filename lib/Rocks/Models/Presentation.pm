package Rocks::Models::Presentation;

use v5.26;
use Moo;
use Types::Standard qw[Str InstanceOf];
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has id => ( is => "ro", isa => Str );
has slides => ( is => "ro", isa => Str );
has video => ( is => "ro", isa => Str );
has happened_at => ( is => "ro", isa => Str );
has event => ( is => "ro", isa => InstanceOf["Rocks::Models::Event"] );
has project => ( is => "ro", isa => InstanceOf["Rocks::Models::Project"] );

sub BUILD($self, $items)
{
    my ($project, $event) = @{$items}{qw[project event]};
    $self->{project} = $project;
    $project->add_presentation($self);
    $self->{event} = $event;
    $event->add_presentation($self);
}

1;
