<?php

namespace App\Http\Controllers;

use App\RegularItems;
use Illuminate\Http\Request;
use DB;
use File;


class RegularItemsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $regular_items=RegularItems::latest()->Paginate(5);
        return view('RegularItems.index',compact('regular_items'))
            ->with('i',(request()-> input('page',1)-1)*5);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('RegularItems.create')->with('catList', $catList);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'description' => 'required',
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $ritem = new RegularItems();
        $ritem->description = $request->description;
        $ritem->name = $request->name;
        $ritem->price = $request->price;
        $ritem->category_id = $request->category_id;


        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $ritem->image = $imageName;

        $ritem->save();


        return redirect()->route('regIndex')
            ->with('success', 'Food item added successfully.');
    }


    public function edit(RegularItems $ritem)
    {
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('RegularItems.edit', compact('ritem'))->with('catList', $catList);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Item $item
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RegularItems $ritem)
    {
        $request->validate([
            'description' => 'required',
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $ritem->name = $request->name;
        $ritem->description = $request->description;
        $ritem->price = $request->price;
        $ritem->category_id = $request->category_id;
        $ritem->image = $request->image;

        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $ritem->image = $imageName;

        $ritem->update();

        return redirect()->route('regIndex')
            ->with('success', 'Food item updated successfully.');
    }


    public function destroy(RegularItems $ritem)
    {
        $item = RegularItems::find($ritem->id);

        if ($ritem->image) {
            File::delete(public_path('foodItems/'.$ritem->image));
        }
        $ritem->delete();

        return redirect()->route('regIndex')
            ->with('success','Food item deleted successfully.');
    }
}
