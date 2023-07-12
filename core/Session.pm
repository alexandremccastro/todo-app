
package Session;

use strict;
use warnings;
use CGI::Session;

sub new {
    my $class = shift;
    my $cgi   = shift;

    my $sessionId = $cgi->cookie('SESSION_ID');
    my $session =
      CGI::Session->new( 'driver:file', $sessionId, { Directory => '/tmp' } );

    my $self = {
        cgi       => $cgi,
        session   => $session,
        sessionId => length $sessionId ? $sessionId : $session->id
    };

    bless $self, $class;
    return $self;
}

sub getId {
    my $self = shift;

    return $self->{sessionId};
}

sub setParam {
    my ( $self, $key, $value ) = @_;

    $self->{session}->param( $key, $value );
}

sub getParam {
    my ( $self, $key ) = @_;

    return $self->{session}->param($key);
}

sub destroy {
    my $self = shift;
    $self->{session}->delete();
    $self->{session}->flush();
}

1;
