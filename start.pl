#!/usr/bin/env perl -w

use v5.26;
use Dotenv -load;
use Mojolicious::Lite -signatures;
use Moo;
use Rocks::Models::Project;
use Rocks::Models::Event;
use Rocks::Storage;

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

my $db = Rocks::Storage::connect(@ENV{qw[DB_USER DB_PASS DB_HOST DB_NAME]});
Rocks::Storage::migrate($db);
Rocks::Storage::rollback($db);
