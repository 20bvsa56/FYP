<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Beverage extends Model
{
    //
    protected $primaryKey='id';
    protected $table = 'beverages';
    protected $fillable=[
        'name','description','price','image'
    ];
    //for security purpose, this data are to be stored in db
}
