<?php


namespace App\Http\Controllers\API;


use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Item as ItemResource;
use App\Item;
use Illuminate\Http\Request;

class ItemController extends BaseController
{
    public function special()
    {
        $items = Item::select('title','name','price','description','image','category_id')->where('type','Special')->get();
        return ItemResource::collection($items);
    }

    public function category($category_id)
    {
        //get single item with category id
        $item= Item::select('id','name','price','description','image','category_id')->where('category_id', $category_id)->get();
        return ItemResource::collection($item);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //checking method, if it is put request we gonna have to include in item_id field
        $item = $request->isMethod('put') ? Item::findorFail($request->item_id) : new Item;

        $item->id = $request->input('item_id');
        $item->type = $request->input('type');
        $item->title = $request->input('title');
        $item->name = $request->input('name');
        $item->price = $request->input('price');
        $item->description = $request->input('description');
        $item->image = $request->input('image');
        $item->category_id = $request->input('category_id');

        if ($item->save()) {
            return new ItemResource($item);
        }
    }


    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
//    public function show($id)
//    {
//        //get single item
//        $item = Item::findorFail($id);
//
//        //return single item as resource
//        return new ItemResource($item);
//    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //get single item
        $item= Item::findorFail($id);

        if($item->delete()) {
            return new ItemResource($item);
        }
    }
}
