#!/usr/bin/env perl -w

use v5.26;
use Mojolicious::Lite -signatures;
use Moo;
use Rocks::Models::Project;
use Rocks::Models::Event;

my $e = Rocks::Models::Event->new(name => "g0v 大松");
my $p = Rocks::Models::Project->from_record({
        name => "woot",
        foo => "bar",
        term => 1,
        event => $e,
        three_words => [qw[happy hacking]],
    });

use Data::Dumper;
say Dumper($p);
