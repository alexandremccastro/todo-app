package CreateActionsTable;

use strict;
use warnings;
use lib "./core/Database";
use parent 'Migration';

sub run {
    my ($self) = shift;

    $self->SUPER::execute(
        'CREATE TABLE IF NOT EXISTS actions (
            uuid VARCHAR(36) NOT NULL,
            list_uuid VARCHAR(36) NOT NULL,
            description VARCHAR(100) NOT NULL,
            priority VARCHAR(50) NOT NULL,
            completed TINYINT NOT NULL DEFAULT 0,
            dueDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updatedAt TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (uuid),
            FOREIGN KEY (list_uuid) REFERENCES lists (uuid) ON DELETE CASCADE
        );'
    );
}

1;
