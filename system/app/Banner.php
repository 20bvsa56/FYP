<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $primaryKey='id';
    protected $table = 'banner_images';
    protected $fillable=[
        'image'
    ];
}
