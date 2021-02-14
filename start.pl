#!/usr/bin/env perl -w

use Mojolicious::Lite -signatures;
use Moo;

get "/" => sub ($c) { $c->render(text => "howdy") };

app->start;
