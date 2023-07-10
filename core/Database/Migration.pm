package Migration;

use strict;
use warnings;
use DB;

sub execute {
    my ( $class, $sql ) = @_;

    my $stmt = DB::prepare($sql);
    $stmt->execute();
    $stmt->finish();
}

1;
