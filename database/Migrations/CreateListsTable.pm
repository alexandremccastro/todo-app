package CreateListsTable;

use strict;
use warnings;
use lib '../core/Database';
use parent 'Migration';

sub run {
    my ($self) = shift;

    $self->SUPER::execute(
        'CREATE TABLE IF NOT EXISTS lists (
            uuid VARCHAR(36) NOT NULL,
            user_uuid VARCHAR(36) NOT NULL,
            name VARCHAR(100) NOT NULL,
            slug VARCHAR(100) NOT NULL,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updatedAt TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (uuid),
            FOREIGN KEY (user_uuid) REFERENCES users (uuid) ON DELETE CASCADE
        );'
    );
}

1;
