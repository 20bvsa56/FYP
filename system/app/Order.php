<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $primaryKey='id';
    protected $casts = [
        'cart' => 'array'
    ];//takes an array and turns into json string while saving in database.
    protected $table = 'orders';
    protected $fillable=[
        'id','tableNo','cart','status'
    ];

    public function items(){
        return $this->hasMany('App\Item');
    }
}
