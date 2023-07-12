package Response;

use strict;
use warnings;

our $instance;

sub new {
  my $class = shift;

  my $self = {
    headers => {
      status => 200
    },
    content => '',
    params  => {}
  };

  bless $self, $class;

  return $self;
}

sub getInstance {
  unless ($instance) {
    $instance = Response->new();
  }

  return $instance;
}

sub getContent {
  my $self = getInstance();
  return $self->{content};
}

sub with {
  my ( $class, %params ) = @_;
  my $self = getInstance();

  foreach my $key ( keys %params ) {
    $self->{params}{$key} = $params{$key};
  }

  return $self;
}

sub withHeaders {
  my ( $class, %headers ) = @_;
  my $self = getInstance();

  foreach my $key ( keys %headers ) {
    $self->{headers}{$key} = $headers{$key};
  }

  return $self;
}

sub redirect {
  my ( $class, $location ) = @_;
  my $self = getInstance();

  $self->withHeaders( status => 302, location => $location );

  return $self;
}

sub content {
  my ( $class, $content ) = @_;
  my $self = getInstance();

  $self->{content} = $content;
  return $self;
}

sub concat {
  my ( $class, $value ) = @_;
  my $self = getInstance();
  $self->{value} .= $value;

  return $self;
}

sub dump {
  my ( $class, $cgi, $session ) = @_;
  my $self = getInstance();

  $self->withHeaders(
    cookie => $cgi->cookie(
      -name  => 'SESSION_ID',
      -value => $session->getId()
    )
  );

  print $cgi->header( $self->{headers} );
  print $self->{content};
}

1;
