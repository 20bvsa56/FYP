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
    Route::get('/categoryCreate', 'CategoryController@create')->name('catCreate');
    Route::get('/categoryIndex', 'CategoryController@index')->name('catIndex');
    Route::post('/categoryStore', 'CategoryController@store')->name('catStore');
    Route::post('/categoryDelete/{category}', 'CategoryController@destroy')->name('catDelete');
    Route::get('/categoryEdit/{category}', 'CategoryController@edit')->name('catEdit');
    Route::post('/categoryUpdate/{category}', 'CategoryController@update')->name('catUpdate');

    Route::get('/itemCreate', 'ItemController@create')->name('itemCreate');
    Route::get('/itemIndex', 'ItemController@index')->name('itemIndex');
    Route::post('/itemStore', 'ItemController@store')->name('itemStore');
    Route::post('/itemDelete/{item}', 'ItemController@destroy')->name('itemDelete');
    Route::get('/itemEdit/{item}', 'ItemController@edit')->name('itemEdit');
    Route::post('/itemUpdate/{item}', 'ItemController@update')->name('itemUpdate');

    Route::get('/regCreate', 'RegularItemsController@create')->name('regCreate');
    Route::get('/regIndex', 'RegularItemsController@index')->name('regIndex');
    Route::post('/regStore', 'RegularItemsController@store')->name('regStore');
    Route::post('/regDelete/{ritem}', 'RegularItemsController@destroy')->name('regDelete');
    Route::get('/regEdit/{ritem}', 'RegularItemsController@edit')->name('regEdit');
    Route::post('/regUpdate/{ritem}', 'RegularItemsController@update')->name('regUpdate');

    Route::get('/roleCreate', 'RoleController@create')->name('roleCreate');
    Route::get('/roleIndex', 'RoleController@index')->name('roleIndex');
    Route::post('/roleStore', 'RoleController@store')->name('roleStore');
    Route::post('/roleDelete/{role}', 'RoleController@destroy')->name('roleDelete');
    Route::get('/roleEdit/{role}', 'RoleController@edit')->name('roleEdit');
    Route::post('/roleUpdate/{role}', 'RoleController@update')->name('roleUpdate');

    Route::get('/bannerCreate', 'BannerImageController@create')->name('banCreate');
    Route::get('/bannerIndex', 'BannerImageController@index')->name('banIndex');
    Route::post('/bannerStore', 'BannerImageController@store')->name('banStore');
    Route::post('/bannerDelete/{banner}', 'BannerImageController@destroy')->name('banDelete');
    Route::get('/bannerEdit/{banner}', 'BannerImageController@edit')->name('banEdit');
    Route::post('/bannerUpdate/{banner}', 'BannerImageController@update')->name('banUpdate');
});





