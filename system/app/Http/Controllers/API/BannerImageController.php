<?php


namespace App\Http\Controllers\API;


use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Banner as BannerResource;
use App\Banner;
use Illuminate\Http\Request;

class BannerImageController extends BaseController
{
    public function index()
    {
        //get items
        $banners = Banner::all();

        //return collection of items as a resource . here, collection returns a list of items
        return BannerResource::collection($banners);
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
        $banner = $request->isMethod('put') ? Item::findorFail($request->banner_id) : new Banner;

        $banner->id = $request->input('banner_id');
        $banner->image = $request->input('image');


        if ($banner->save()) {
            return new BannerResource($banner);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //get single item
        $banner = Banner::findorFail($id);

        //return single item as resource
        return new BannerResource($banner);
    }

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
        $banner= Banner::findorFail($id);

        if($banner->delete()) {
            return new BannerResource($banner);
        }
    }
}
