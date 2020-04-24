<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $primaryKey='id';
    protected $table = 'categories';
    protected $fillable=[
        'id','name','image'
    ];
    //for security purpose, this data are to be stored in db

    public function items(){
        return $this->hasMany('App\Item');
    }

}
