package DB;

use strict;
use warnings;
use DBI;

our $instance;

sub getInstance {
  unless ($instance) {
    my $host     = $ENV{DB_HOST};
    my $port     = $ENV{DB_PORT};
    my $database = $ENV{DB_NAME};
    my $user     = $ENV{DB_USER};
    my $passwd   = $ENV{DB_PASSWD};

    $instance =
      DBI->connect( "dbi:mysql:database=$database;host=$host;port=$port",
      $user, $passwd )
      or die "Error connecting to database: $DBI::errstr";
  }

  return $instance;
}

sub prepare {
  my $sql      = shift;
  my $instance = getInstance();
  return $instance->prepare($sql);
}

1;
