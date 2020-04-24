<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $primaryKey='id';
    protected $table = 'orders';
    protected $fillable=[
        'tableNo','cart','status'
    ];

    public function items(){
        return $this->hasMany('App\Item');
    }
}
