package Render;

use strict;
use warnings;
use Text::Template;

sub view {
    my ( $viewName, $params ) = @_;
    my $template = Text::Template->new(
        TYPE   => 'FILE',
        SOURCE => "../resources/views/$viewName.html"
    );

    print $template->fill_in( HASH => $params );
}

1;
