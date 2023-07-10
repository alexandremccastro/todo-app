package MigrationRunner;

use strict;
use warnings;
use lib "./database/Migrations";
use CreateUsersTable;
use CreateListsTable;
use CreateActionsTable;

sub execute {
    CreateUsersTable->run();
    CreateListsTable->run();
    CreateActionsTable->run();
}

1;
