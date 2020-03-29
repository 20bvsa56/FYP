<?php

namespace App\Providers;

use App\Http\Resources\Category;
use App\Http\Resources\Item;
use App\Http\Resources\Registration as RegistrationResource;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use App\Http\Resources\Item as ItemResource;
use App\Http\Resources\Category as CategoryResource;
//use Illuminate\Http\Resources\Json\Resource;



class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //

        /*Route::bind('category', function($value){
            return \App\Category::where('id', $value)->first();
        });*/


    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        CategoryResource::withoutWrapping();
        ItemResource::withoutWrapping();
        RegistrationResource::withoutWrapping();
    }
}
