package AuthController;

use strict;
use warnings;
use lib "../core/Template";
use Text::Template;
use Data::Dumper;
use Render;

sub sayHello {
    print '<h1>Hello MVC</h1>';
}

sub hailMVC {

    Render::view(
        'home',
        {
            name => "Alexandre"
        }
    );
}

1;
