package Route;

use strict;
use warnings;
use lib '../Router';
use Handler;
use CGI;

our @handlers = ();

sub new {
    my $class = shift;
    my $self  = {};

    bless $self, $class;

    return $self;
}

sub get {
    my ( $uri, $handler ) = @_;

    push @handlers, Handler->new( $uri, 'GET', $handler );
}

sub post {
    my ( $uri, $handler ) = @_;

    push @handlers, Handler->new( $uri, 'POST', $handler );
}

sub put {
    my ( $uri, $handler ) = @_;

    push @handlers, Handler->new( $uri, 'PUT', $handler );
}

sub patch {
    my ( $uri, $handler ) = @_;

    push @handlers, Handler->new( $uri, 'PATCH', $handler );
}

sub delete {
    my ( $uri, $handler ) = @_;

    push @handlers, Handler->new( $uri, 'DELETE', $handler );
}

sub dispatch {
    my ( $class, $cgi, $session ) = @_;

    my $target;

    foreach my $handler (@handlers) {
        if ( $handler->matches( $cgi->request_uri, $cgi->request_method ) ) {
            $target = $handler;
        }
    }

    if ($target) {
        my $response = $target->execute( $cgi, $session );
        $response->dump( $cgi, $session );
    }
}

1;
