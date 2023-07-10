#!/usr/bin/perl

use strict;
use warnings;
use feature 'switch';    # Enable experimental feature
use lib './database';
use lib './database/Migrations';
use MigrationRunner;
use Dotenv;

my $value = $ARGV[0];

Dotenv->load('.env');

if ( $value eq 'migrate' ) {
    MigrationRunner->execute();
}
else {
    print 'Invalid argument', "\n";    # Corrected newline character escape
}
