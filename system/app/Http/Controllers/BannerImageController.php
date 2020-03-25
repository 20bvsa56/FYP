<?php

namespace App\Http\Controllers;

use App\Banner;
use Illuminate\Http\Request;
use DB;
use File;

class BannerImageController extends Controller
{

    public function __construct()
    {
//        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //banner images var stores data from the db
        $banners=Banner::latest()->Paginate(5);
        return view('BannerImages.index',compact('banners'))
            ->with('i',(request()-> input('page',1)-1)*5);
        //compact stores vdata in key and value form
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('BannerImages.create');
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $banner = new Banner();
        $banner->image = $request->image;


        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('bannerImage/'), $imageName);
        $banner->image = $imageName;

        $banner->save();

        return redirect()->route('banIndex')
            ->with('success','Banner image added successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Banner $banner)
    {
        //dd($category);
        return view('BannerImages.edit', compact('banner'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Banner $banner)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $banner->image = $request->image;

        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('bannerImage/'), $imageName);
        $banner->image = $imageName;

        $banner->update();

        return redirect()->route('banIndex')
            ->with('success','Banner image updated successfully.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Banner $banner)
    {
        $image = Banner::find($banner->id);

        if ($image->image) {
            File::delete(public_path('bannerImage/'.$banner->image));
        }
        $image->delete();

        return redirect()->route('banIndex')
            ->with('success','Banner image deleted successfully.');
    }
}
