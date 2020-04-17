<?php

namespace App\Http\Controllers;

use App\Category;
use App\Item;
use Illuminate\Http\Request;
use DB;
use File;


class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items=Item::latest()->Paginate(5);
        return view('Items.index',compact('items'))
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
        return view('Items.create')->with('catList', $catList);
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
            'category_id' => 'required',
            'type' => 'required',
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,jfif|max:2048',
        ]);
//        dd($request);
//        Item::create($request->all());
        $item = new Item();
        $item->title = $request->title;
        $item->name = $request->name;
        $item->price = $request->price;
        $item->description = $request->description;
        $item->type = $request->type;
        $item->category_id = $request->category_id;


        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $item->image = $imageName;

        $item->save();


        return redirect()->route('itemIndex')
            ->with('success', 'Food item added successfully.');
    }

    public function show(Item $item)
    {
        //
    }


    public function edit(Item $item)
    {
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('Items.edit', compact('item'))->with('catList', $catList);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Item $item
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Item $item)
    {
        $request->validate([
            'type' => 'required',
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $item->title = $request->title;
        $item->name = $request->name;
        $item->price = $request->price;
        $item->description = $request->description;
        $item->type = $request->type;
        $item->category_id = $request->category_id;


        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $item->image = $imageName;

        $item->update();


        return redirect()->route('itemIndex')
            ->with('success', 'Food item updated successfully.');
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function destroy(Item $item)
    {
        $item = Item::find($item->id);

        if ($item->image) {
            File::delete(public_path('foodItems/'.$item->image));
        }
        $item->delete();

        return redirect()->route('itemIndex')
            ->with('success','Food item deleted successfully.');
    }
}
