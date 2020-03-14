<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/categoryCreate', 'CategoryController@create')->name('catCreate');
Route::get('/categoryIndex', 'CategoryController@index')->name('catIndex');
Route::post('/categoryStore', 'CategoryController@store')->name('catStore');
Route::post('/categoryDelete/{id}', 'CategoryController@destroy')->name('catDelete');
Route::get('/categoryEdit/{id}', 'CategoryController@edit')->name('catEdit');
Route::post('/categoryUpdate/{id}', 'CategoryController@update')->name('catUpdate');


Route::get('/itemCreate', 'ItemController@create')->name('itemCreate');
Route::get('/itemIndex', 'ItemController@index')->name('itemIndex');
Route::post('/itemStore', 'ItemController@store')->name('itemStore');
Route::post('/itemDelete/{id}', 'ItemController@destroy')->name('itemDelete');
Route::get('/itemEdit/{id}', 'ItemController@edit')->name('itemEdit');
Route::post('/itemUpdate/{id}', 'ItemController@update')->name('itemUpdate');



