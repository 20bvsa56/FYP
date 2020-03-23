<?php


namespace App\Http\Controllers\API;

use App\Http\Resources\RegularItem as RegularItemResource;
use App\RegularItems;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;

class RegularItemController extends BaseController
{
    public function index()
    {
        //get regular items
        $regular_items = RegularItems::all();

        //return collection of beverages as a resource . here, collection returns a list of items
        return RegularItemResource::collection($regular_items);
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
        //checking method, if it is put request we gonna have to include in regularItem_id field
        $regular_items = $request->isMethod('put') ? Beverage::findorFail($request->regularItem_id) : new RegularItems();

        $regular_items->id = $request->input('regularItem_id');
        $regular_items->name = $request->input('name');
        $regular_items->name = $request->input('description');
        $regular_items->name = $request->input('price');
        $regular_items->image = $request->input('image');
        $regular_items->category_id = $request->input('category_id');

        if ($regular_items->save()) {
            return new RegularItemResource($regular_items);
        }

    }

    /**
     * Display the specified resource.a
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //get single regular item
        $regular_items = RegularItems::findorFail($id);

        //return single regular item as resource
        return new RegularItemResource($regular_items);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //delete single regular_items
        $regular_items = RegularItems::findorFail($id);

        if ($regular_items->delete()) {
            return new RegularItemResource($regular_items);
        }
    }
}
