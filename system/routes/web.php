<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware'=>'auth'], function(){
    Route::get('/staffIndex', 'API\AuthController@index')->name('staffIndex');
    Route::post('/registration', 'API\AuthController@register')->name('registerStaff');

    Route::get('/categoryCreate', 'CategoryController@create')->name('catCreate');
    Route::get('/categoryIndex', 'CategoryController@index')->name('catIndex');
    Route::post('/categoryStore', 'CategoryController@store')->name('catStore');
    Route::post('/categoryDelete/{category}', 'CategoryController@destroy')->name('catDelete');
    Route::get('/categoryEdit/{category}', 'CategoryController@edit')->name('catEdit');
    Route::post('/categoryUpdate/{category}', 'CategoryController@update')->name('catUpdate');
    Route::get('/categorySearch', 'CategoryController@search');

    Route::get('/itemCreate', 'ItemController@create')->name('itemCreate');
    Route::get('/itemIndex', 'ItemController@index')->name('itemIndex');
    Route::post('/itemStore', 'ItemController@store')->name('itemStore');
    Route::post('/itemDelete/{item}', 'ItemController@destroy')->name('itemDelete');
    Route::get('/itemEdit/{item}', 'ItemController@edit')->name('itemEdit');
    Route::post('/itemUpdate/{item}', 'ItemController@update')->name('itemUpdate');
    Route::get('/itemSearch', 'ItemController@search');
    Route::get('/itemSort', 'ItemController@sort');

    Route::get('/bannerCreate', 'BannerImageController@create')->name('banCreate');
    Route::get('/bannerIndex', 'BannerImageController@index')->name('banIndex');
    Route::post('/bannerStore', 'BannerImageController@store')->name('banStore');
    Route::post('/bannerDelete/{banner}', 'BannerImageController@destroy')->name('banDelete');
    Route::get('/bannerEdit/{banner}', 'BannerImageController@edit')->name('banEdit');
    Route::post('/bannerUpdate/{banner}', 'BannerImageController@update')->name('banUpdate');

    Route::get('/payments', 'PaymentController@index')->name('paymentIndex');

});





