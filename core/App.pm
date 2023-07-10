package App;

use strict;
use warnings;
use lib '../routes';
use lib '../core/Router';
use Dotenv;
use Session;
use Route;
use Web;

Dotenv->load('../.env');

sub new {
    my ($class) = shift;
    my $self = { session => Session->new() };

    $self->{session}->start();

    bless $self, $class;

    return $self;
}

sub handle {
    my ( $self, $requestURI ) = @_;

    Route->dispatch($requestURI);
}

1;
