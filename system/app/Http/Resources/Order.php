<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Order extends JsonResource
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
            'tableNo'=>$this->tableNo,
            'cart'=>$this->cart,
            'status'=>$this->status
        ];
    }
}
