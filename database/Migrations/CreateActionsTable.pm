package CreateActionsTable;

use strict;
use warnings;
use lib "./core/Database";
use parent 'Migration';

sub run {
    my ($self) = shift;

    $self->SUPER::execute(
        'CREATE TABLE IF NOT EXISTS actions (
            id INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,
            listId INT(11) UNSIGNED NOT NULL,
            description VARCHAR(100) NOT NULL,
            priority VARCHAR(50) NOT NULL,
            completed TINYINT NOT NULL DEFAULT 0,
            dueDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            FOREIGN KEY (listId) REFERENCES lists (id) ON DELETE CASCADE
        );'
    );
}

1;
