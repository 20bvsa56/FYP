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

Route::resource('category', 'API\CategoryController');
Route::resource('special_item', 'API\ItemController');
Route::resource('registration', 'API\RegistrationController');
Route::resource('regular_item', 'API\RegularItemController');
Route::get('regular_item/{category_id}', 'API\RegularItemController@show');
Route::resource('banner_image', 'API\BannerImageController');
