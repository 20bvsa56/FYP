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

//delete categories
Route::delete('delete_category/{id}', 'CategoryAPIController@destroy');



