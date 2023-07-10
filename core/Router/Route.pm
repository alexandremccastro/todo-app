package Route;

use strict;
use warnings;
use lib '../Router';
use Handler;

our @handlers = ();

sub new {
    my $class = shift;
    my $self  = {};

    bless $self, $class;

    return $self;
}

sub post {
    my ( $uri, $handler ) = @_;

    push @handlers, Handler->new( $uri, $handler );
}

sub dispatch {
    my ( $self, $uri ) = @_;
    my $target;

    foreach my $handler (@handlers) {
        if ( $handler->matches($uri) ) {
            $target = $handler;
        }
    }

    if ($target) {
        $target->execute();
    }
}

1;
