<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $primaryKey='id';
    protected $table = 'roles';
    protected $fillable=[
        'title'
    ];
    //for security purpose, this data are to be stored in db
}
