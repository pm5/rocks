package Rocks::Sources::Hackmd;

use v5.26;
use feature qw[signatures];
use experimental qw[switch signatures];
use Rocks::Utils qw[ua];

my %requests = (
    overview => {
        method => "GET",
        url => "api/overview",
        base_url => "https://g0v.hackmd.io/",
    },
);

sub pull_overview {
    my $res = Rocks::Utils::ua($requests{get_overview});
}

say pull_overview();

1;
