package Handler;

use strict;
use warnings;

sub new {
    my ($class) = shift;
    my $uri     = shift;
    my $regex   = $uri;

    $regex =~ s/\{[(a-zA-Z0-9)]+\}/[(a-zA-Z0-9)]+/g;

    my $self = {
        uri     => $uri,
        regex   => $regex,
        handler => shift
    };

    bless $self, $class;

    return $self;
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
    my ( $self, $uri ) = @_;
    return $uri =~ $self->{regex};
}

sub execute {
    my $self = shift;

    $self->{handler}();
}

1;
