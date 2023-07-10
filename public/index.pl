#!/usr/bin/perl

use strict;
use warnings;
use lib '../core';
use App;

# App instance that will
my $app = App->new();

$app->handle( $ENV{REQUEST_URI} );

1;
