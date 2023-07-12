
use strict;
use warnings;
use lib '../core/Router';
use lib '../app/Controllers';
use lib '../core/Http';
use Response;
use Route;
use AuthController;
use ListController;

Route::get(
  '/',
  sub {
    return Response->redirect('/login');
  }
);

Route::get( '/login', \&AuthController::login );
Route::post( '/login', \&AuthController::attemptLogin );
Route::get( '/register', \&AuthController::register );
Route::post( '/register', \&AuthController::attemptRegister );

Route::get( '/home', \&ListController::home );

1;
