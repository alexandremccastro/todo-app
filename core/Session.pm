
package Session;

use strict;
use warnings;
use CGI;
use CGI::Session;

sub new {
    my $class = shift;
    my $cgi   = CGI->new();

    my $sessionId = $cgi->cookie('SESSION_ID');

    my $self = {
        cgi     => $cgi,
        session => CGI::Session->new(
            'driver:file',
            !undef $sessionId ? $sessionId : '',
            { Directory => '/tmp' }
        )
    };

    bless $self, $class;
    return $self;
}

sub start {
    my $self = shift;

    print $self->{cgi}->header(
        -cookie => $self->{cgi}->cookie(
            -name  => 'SESSION_ID',
            -value => $self->{session}->id
        )
    );
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
