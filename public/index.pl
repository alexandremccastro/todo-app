#!/usr/bin/perl

use strict;
use warnings;
use lib '../core';
use App;

# App instance that will
my $app = App->new();

$app->start();

1;
