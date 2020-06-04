<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $primaryKey='id';
    protected $table = 'payments';
    protected $fillable=[
        'order_id','totalAmount'
    ];
}
