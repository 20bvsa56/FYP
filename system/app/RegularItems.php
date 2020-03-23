<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RegularItems extends Model
{
    protected $primaryKey='id';
    protected $table = 'regular_items';
    protected $fillable=[
        'name','description','price','image'
    ];
    //for security purpose, this data are to be stored in db

    public function category(){
        return $this->belongsTo('App\Category');
    }
}
