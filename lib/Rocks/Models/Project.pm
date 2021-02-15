package Rocks::Models::Project;

use Moo;
use Types::Standard qw[Str Enum ArrayRef Maybe InstanceOf];
use Types::Common::Numeric qw[PositiveOrZeroInt];
use namespace::autoclean;

use feature qw[signatures];
no warnings qw[experimental::signatures];

has id => ( is => "ro", isa => Str );
has name => ( is => "ro", isa => Str );
has purpose => ( is => "ro", isa => Str );
has category => ( is => "ro", isa => Str );
has date => ( is => "ro", isa => Str );
has last_action_date => ( is => "ro", isa => Str );
has event => ( is => "ro", isa => InstanceOf["Rocks::Models::Event"] );
has term => ( is => "ro", isa => PositiveOrZeroInt );
has three_brief => ( is => "ro", isa => ArrayRef[Str] );
has manpower => ( is => "ro", isa => Str );
has guideline => ( is => "ro", isa => Str );
has other_docs => ( is => "ro", isa => ArrayRef[Str] );
has video => ( is => "ro", isa => Str );
has owner => ( is => "ro", isa => ArrayRef[Str] );
has github_repo => ( is => "ro", isa => Str );
has github_issues => ( is => "ro", isa => PositiveOrZeroInt );
has facebook => ( is => "ro", isa => Maybe[Str] );
has slack_id => ( is => "ro", isa => Maybe[Str] );
has slack_channel => ( is => "ro", isa => Maybe[Str] );
has email => ( is => "ro", isa => Str );
has telegram => ( is => "ro", isa => Str );
has continue_contribute => ( is => "ro", isa => Enum[qw[yes no other]] );
has license_code => ( is => "ro", isa => Str );
has license_data => ( is => "ro", isa => Str );
has education => ( is => "ro", isa => Str );
has tags => ( is => "ro", isa => ArrayRef[Str] );

sub from_record ($class, $record)
{
    $class->new(%$record);
}

1
