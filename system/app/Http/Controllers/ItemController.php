<?php

namespace App\Http\Controllers;

use App\Category;
use App\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //items var stores data from the db
        $items=Item::latest()->paginate(5);
        return view('Items.index',compact('items'))
            ->with('i',(request()-> input('page',1)-1)*5);
        //compact stores data in key and value form
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       // $catList = Category::pluck('id', 'name');
//        $category = Category::all();
        return view('Items.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $item= new Item();

        $request->validate([
            'category_id'=>'required',
            'title'=>'required',
            'name' => 'required',
            'price' => 'required',
            'image'=>'required'
        ]);

        Item::create($request->all());

        if ($request->hasFile('image')) {
            $image = $request->image;
            $fileName = time() . "." . $image->getClientOriginalExtension();
            $destination_path = public_path("foodItems/");
            $image->move($destination_path, $fileName);
            $item->image = 'foodItems/' . $fileName;
        }

        $item->save();


        return redirect()->route('itemIndex')
            ->with('success','Food item added successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function show(Item $item)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function edit(Item $item)
    {
        return view('Items.edit',compact('item'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Item $item)
    {
        $request->validate([
            'category_id'=>'required',
            'title'=>'required',
            'name' => 'required',
            'price' => 'required',
            'image' => 'required|image|mimes:jpeg|max:2048'
        ]);

        $item->update($request->all());

        return redirect()->route('itemIndex')
            ->with('success','Food item updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function destroy(Item $item)
    {
        $item->delete();

        return redirect()->route('itemIndex')
            ->with('success','Food item deleted successfully.');
    }
}
