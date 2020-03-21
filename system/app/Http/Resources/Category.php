<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Category extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //toArray-> returns the array of attributes that should be converted to JSON when sending the response
        //return parent::toArray($request);
        return [
            'id'=>$this->id,
            'name'=>$this->name,
            'type'=>$this->image
        ];
    }
}
