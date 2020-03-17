<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Registration extends Model
{
    protected $primaryKey='id';
    protected $table = 'registrations';
    protected $fillable=[
        'username','email','password'
    ];
}
