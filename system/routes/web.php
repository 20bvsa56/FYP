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
Route::get('/categoryStore', 'CategoryController@store')->name('catStore');
Route::get('/categoryDelete', 'CategoryController@destroy')->name('catDelete');



