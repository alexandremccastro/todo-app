package AuthController;

use strict;
use warnings;
use lib "../core/Template";
use lib "../core/Database";
use Text::Template;
use Data::Dumper;
use DB;
use Render;

sub sayHello {
    Render::view(
        'home',
        {
            name => "Hello world!"
        }
    );
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
