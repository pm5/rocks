use v5.26;
use Test::More;

use aliased "Rocks::Core::Project";
use aliased "Rocks::Core::Presentation";
use aliased "Rocks::Core::Event";
use DateTime;

sub test_basics
{
    my $proj = Project->new(name => "g0v.rocks");
    my $hack = Event->new(
        name => "g0v hackathon",
        happened_at => DateTime->new(
            year => 2019, month => 4, day => 1, time_zone => "Asia/Taipei"
        ),
    );
    my $sack = Event->new(
        name => "an0ther hackathon",
        happened_at => DateTime->new(
            year => 2020, month => 4, day => 1, time_zone => "Asia/Taipei"
        ),
    );

    my $p0   = Presentation->new(project => $proj, event => $hack);
    my $p1   = Presentation->new(project => $proj, event => $sack);

    is_deeply $p0->project, $proj;
    is_deeply $p0->event,   $hack;
    is_deeply $proj->presentations, [ $p0, $p1 ];
    is_deeply $hack->presentations, [ $p0 ];
    is_deeply $sack->presentations, [ $p1 ];
}

test_basics;
done_testing;
