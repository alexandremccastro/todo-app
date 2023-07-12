package App;

use strict;
use warnings;
use lib '../' . 'routes';
use lib '../core/Router';
use Dotenv;
use CGI;
use Session;
use Route;
use Web;

Dotenv->load('../.env');

sub new {
    my ($class) = shift;
    my $cgi = CGI->new();

    my $self = {
        cgi     => $cgi,
        session => Session->new($cgi)
    };

    bless $self, $class;

    return $self;
}

sub start {
    my $self = shift;

    Route->dispatch( $self->{cgi}, $self->{session} );
}

1;
