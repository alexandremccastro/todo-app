package ListController;

use strict;
use warnings;
use lib '../core';
use lib '../core/Template';
use Render;
use Session;

sub home {
  my ( $cgi, $session ) = @_;
  my $user = $session->getParam('user');

  return Render::view(
    'home',
    {
      name => $user->{email}
    }
  );
}

1;
