package AuthController;

use strict;
use warnings;
use lib "../core/Template";
use lib "../core/Database";
use lib "../core";
use lib "../core/Http";
use Text::Template;
use Data::Dumper;
use DB;
use Render;
use Data::Dump qw(dump);
use Crypt::PBKDF2;
use Response;
use Session;

sub login {
  return Render::view('auth/login');
}

sub attemptLogin {
  my ( $cgi, $session ) = @_;

  my $email    = $cgi->param('email');
  my $password = $cgi->param('password');
  my $pbkdf2   = Crypt::PBKDF2->new();

  my $sth =
    DB->getInstance()
    ->prepare(
    'SELECT id, name, email, password FROM users WHERE email = ? LIMIT 1');

  $sth->execute($email);
  $sth->finish();
  my $hashRef = $sth->fetchrow_hashref();

  if ( $pbkdf2->validate( $hashRef->{password}, $password ) == 1 ) {
    $session->setParam( 'user', \%{$hashRef} );

    return Response->redirect('/home')
      ->with( success => 'Successfully logged in.' );
  }
  else {
    return Response->redirect('/login')
      ->with( success => 'Invalid credentials.' );
  }
}

sub register {
  return Render::view('auth/register');
}

sub attemptRegister {
  my ($cgi) = @_;

  my $pbkdf2   = Crypt::PBKDF2->new();
  my $password = $cgi->param('password');

  my $hash  = $pbkdf2->generate($password);
  my $name  = $cgi->param('name');
  my $email = $cgi->param('email');

  my $sth =
    DB->getInstance()
    ->prepare('INSERT INTO users (name, email, password) VALUES (?, ?, ?)');

  $sth->execute( $name, $email, $hash );
  $sth->finish();
  if ( $sth->rows == 1 ) {
    return Response->redirect('/login')
      ->with( success => 'Successfully registered.' );
  }
  else {
    return Response->redirect('/register')
      ->with( error => 'Error in registration.' );
  }
}

1;
