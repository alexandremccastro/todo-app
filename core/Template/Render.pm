package Render;

use strict;
use warnings;
use Text::Template;
use lib '../Http';
use Response;

sub view {
    my ( $viewName, $params ) = @_;

    my $template = Text::Template->new(
        TYPE   => 'FILE',
        SOURCE => "../resources/views/$viewName.html"
    );

    my $data = $template->fill_in( HASH => $params );

    return Response->content($data);
}

1;
