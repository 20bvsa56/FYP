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
Route::get('special', 'API\ItemController@special');
Route::get('item/{category_id}', 'API\ItemController@category');
Route::resource('banner_image', 'API\BannerImageController');
Route::resource('order', 'API\OrderController');
Route::put('status/{id}', 'API\OrderController@status');
Route::resource('payment', 'API\PaymentController');
Route::post('login', 'API\AuthController@login');
