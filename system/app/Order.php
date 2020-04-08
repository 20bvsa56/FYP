<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $primaryKey='id';
    protected $table = 'orders';
    protected $fillable=[
        'table','orderNum','item','quantity','totalAmount'
    ];
}
