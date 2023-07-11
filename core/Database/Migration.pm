package Migration;

use strict;
use warnings;
use DB;

sub execute {
    my ( $class, $sql ) = @_;

    my $sth = DB->getInstance()->prepare($sql);
    $sth->execute();
    $sth->finish();
}

1;
