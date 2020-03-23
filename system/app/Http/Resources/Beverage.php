<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Beverage extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
//        return parent::toArray($request);
        //toArray-> returns the array of attributes that should be converted to JSON when sending the response

        return [
            'id'=>$this->id,
            'name'=>$this->name,
            'description'=>$this->description,
            'price'=>$this->price,
            'image'=>$this->image
        ];
    }
}
