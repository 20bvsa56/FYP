<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RegularItems extends Model
{
    //
}

class Beverage extends Model
{
    //
    protected $primaryKey='id';
    protected $table = 'beverages';
    protected $fillable=[
        'title','name','price','image'
    ];
    //for security purpose, this data are to be stored in db
}
