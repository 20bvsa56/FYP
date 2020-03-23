<?php


namespace App\Http\Controllers\API;

use App\Beverage;
use App\Http\Resources\Category as BeverageResource;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;

class BevController extends BaseController
{
    public function index()
    {
        //get beverages
        $beverages = Beverage::all();

        //return collection of beverages as a resource . here, collection returns a list of items
        return BeverageResource::collection($beverages);
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
        //checking method, if it is put request we gonna have to include in beverage_id field
        $beverage = $request->isMethod('put') ? Beverage::findorFail($request->beverage_id) : new Beverage;

        $beverage->id = $request->input('category_id');
        $beverage->name = $request->input('name');
        $beverage->image = $request->input('image');

        if ($beverage->save()) {
            return new BeverageResource($beverage);
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
        //get single category
        $beverage = Beverage::findorFail($id);

        //return single category as resource
        return new BeverageResource($beverage);
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
        //delete single $beverage
        $beverage = Beverage::findorFail($id);

        if ($beverage->delete()) {
            return new BeverageResource($beverage);
        }
    }
}
