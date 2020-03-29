<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Item extends JsonResource
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
        //return parent::toArray($request);
        return [
            'id'=>$this->id,
            'category_id'=>$this->category_id,
            'title'=>$this->title,
            'type'=>$this->type,
            'name'=>$this->name,
            'price'=>$this->price,
            'description'=>$this->description,
            'image'=>$this->image
        ];
    }
}
