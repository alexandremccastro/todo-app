package ListController;

use strict;
use warnings;
use lib '../core';
use lib '../core/Template';
use lib '../core/Http';
use lib '../core/Database';
use Render;
use Response;
use DB;
use Session;
use JSON;

sub create {
  my ( $cgi, $session ) = @_;

  my $user = $session->getParam('user');
  my $name = $cgi->param('name');
  my @spl  = split( ' ', $name );
  my $slug = join( '-', @spl );

  my $sth =
    DB->getInstance()
    ->prepare('INSERT INTO lists (userId, name, slug) VALUES (?, ?, ?)');

  $sth->execute( $user->{id}, $name, $slug );
  $sth->finish();

  return Response->redirect('/home');
}

sub home {
  my ( $cgi, $session ) = @_;
  my $user = $session->getParam('user');

  my $data = {
    name => [
      {
        name => 'Alexandre',
      },
      {
        name => 'Pedro'
      }
    ]
  };

  my $json = encode_json($data);

  return Render::view(
    'home',
    {
      name => $json
    }
  );
}

1;
