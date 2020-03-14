<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $primaryKey='id';
    protected $table = 'items';
    protected $fillable=[
        'category_id','title','name','price','image'
    ];
    //for security purpose, this data are to be stored in db

}