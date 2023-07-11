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
    print 'Tentando logar';
}

sub register {
    return Render::view('auth/register');
}

sub attemptRegister {
    my ( $cgi, $session ) = @_;

    my $pbkdf2   = Crypt::PBKDF2->new();
    my $password = $cgi->param('password');

    my $hash  = $pbkdf2->generate($password);
    my $name  = $cgi->param('name');
    my $email = $cgi->param('email');

    my $sth =
      DB->getInstance()
      ->prepare('INSERT INTO users (name, email, password) VALUES (?, ?, ?)');

    $sth->execute( $name, $email, $hash );

    if ( $sth->rows == 1 ) {
        Response->redirect('/login')
          ->with( success => 'Successfully registered.' );
    }
    else {
        Response->redirect('/register')
          ->with( error => 'Error in registration.' );
    }
}

1;
