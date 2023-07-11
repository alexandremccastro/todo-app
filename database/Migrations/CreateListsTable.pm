package CreateListsTable;

use strict;
use warnings;
use lib '../core/Database';
use parent 'Migration';

sub run {
    my ($self) = shift;

    $self->SUPER::execute(
        'CREATE TABLE IF NOT EXISTS lists (
            id INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
            userId INT(11) UNSIGNED NOT NULL,
            name VARCHAR(100) NOT NULL,
            slug VARCHAR(100) NOT NULL,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            FOREIGN KEY (userId) REFERENCES users (id) ON DELETE CASCADE
        );'
    );
}

1;
