<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $primaryKey='id';
    protected $table = 'categories';
    protected $fillable=[
        'name','type'
    ];
    //for security purpose, this data are to be stored in db
}
