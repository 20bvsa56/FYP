<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $primaryKey='id';
    protected $table = 'items';
    protected $fillable=[
        'id','category_id','title','name','price','image','description','type','image'
    ];
    //for security purpose, this data are to be stored in db

    public function category(){
        return $this->belongsTo('App\Category');
    }

    public function order(){
        return $this->belongsTo('App\Order');
    }

}
