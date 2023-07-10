
use strict;
use warnings;
use lib '../core/Router';
use lib '../app/Controllers';

use Route;
use AuthController;

Route::post( '/hello', \&AuthController::sayHello );
Route::post( '/hail',  \&AuthController::hailMVC );

1;
