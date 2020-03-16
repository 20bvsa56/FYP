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
Route::get('categories', 'CategoryAPIController@index');

//list single categories
Route::get('categories/{id}', 'CategoryAPIController@show');

//create new category
Route::post('category', 'CategoryAPIController@store');

//update categories
Route::put('categories', 'CategoryAPIController@store');

//delete categories
Route::delete('categories', 'CategoryAPIController@delete');



