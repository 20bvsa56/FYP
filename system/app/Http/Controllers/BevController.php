<?php

namespace App\Http\Controllers;

use App\Beverage;
use Illuminate\Http\Request;
use DB;
use File;

class BevController extends Controller
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

        $beverages=Beverage::latest()->paginate(5);
        return view('RegularItems.bevindex',compact('beverages'))
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
        return view('RegularItems.bevcreate');
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
            'name' => 'required',
            'description' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $beverage = new Beverage();
        $beverage->name = $request->name;
        $beverage->description = $request->description;
        $beverage->price = $request->price;
        $beverage->image = $request->image;

        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $beverage->image = $imageName;

        $beverage->save();

        return redirect()->route('bevIndex')
            ->with('success','Beverage item added successfully.');
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
    public function edit(Beverage $beverage)
    {
        return view('RegularItems.bevedit', compact('beverage'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Beverage $beverage)
    {
        $request->validate([

            'name' => 'required',
            'description' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $beverage->name = $request->name;
        $beverage->description = $request->description;
        $beverage->price = $request->price;
        $beverage->image = $request->image;

        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $beverage->image = $imageName;

        $beverage->update();

        return redirect()->route('bevIndex')
            ->with('success','Beverage item updated successfully.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Beverage $beverage)
    {

        $beverage = Beverage::find($beverage->id);

        if ($beverage->image) {
            File::delete(public_path('foodItems/'.$beverage->image));
        }
        $beverage->delete();

        return redirect()->route('bevIndex')
            ->with('success','Beverage item deleted successfully.');
    }
}
