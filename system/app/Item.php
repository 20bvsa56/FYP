<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $primaryKey='id';
    protected $table = 'items';
    protected $fillable=[
        'title','name','price','image'
    ];
    //for security purpose, this data are to be stored in db

    public function category(){
        return $this->belongsTo('App\Category');
    }

}
