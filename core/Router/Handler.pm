package Handler;

use strict;
use warnings;
use lib '../core/Http';
use Response;
use Data::Dumper;

sub new {
    my ($class) = shift;
    my $uri     = shift;
    my $method  = shift;
    my $regex   = $uri;

    $regex =~ s/\{[(a-zA-Z0-9)]+\}/[(a-zA-Z0-9)]+/g;

    my $self = {
        uri     => $uri,
        method  => $method,
        regex   => $regex,
        handler => shift
    };

    bless $self, $class;

    return $self;
}

sub getMethod {
    my $self = shift;
    return $self->{method};
}

sub getUri {
    my $self = shift;
    return $self->{uri};
}

sub getRegex {
    my $self = shift;
    return $self->{regex};
}

sub matches {
    my ( $self, $uri, $requestMethod ) = @_;
    return $uri =~ $self->{regex} && $requestMethod eq $self->{method};
}

sub execute {
    my ( $self, $cgi, $session ) = @_;

    return $self->{handler}( $cgi, $session );
}

1;
