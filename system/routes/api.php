<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//list categories
Route::get('view_categories', 'CategoryAPIController@index');

//list single categories
Route::get('single_category/{id}', 'CategoryAPIController@show');

//create new category
Route::post('add_category', 'CategoryAPIController@store');

//update categories
Route::put('update_category', 'CategoryAPIController@store');

//delete categoriesi
Route::delete('delete_category/{id}', 'CategoryAPIController@destroy');

//list registries
Route::get('view_registries', 'RegistrationAPIController@index');

//list single registries
Route::get('single_registry/{id}', 'RegistrationAPIController@show');

//create new registry
Route::post('add_registry', 'RegistrationAPIController@store');

//update registry
Route::put('update_registry', 'RegistrationAPIController@store');

//delete registry
Route::delete('delete_registry/{id}', 'RegistrationAPIController@destroy');



