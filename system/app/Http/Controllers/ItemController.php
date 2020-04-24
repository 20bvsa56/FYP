<?php

namespace App\Http\Controllers;

use App\Category;
use App\Item;
use Illuminate\Http\Request;
use DB;
use Symfony\Component\Console\Input\Input;
use File;

class ItemController extends Controller
{

    public function index()
    {
        $items=Item::latest()->Paginate(5);
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('Items.index',compact('items'))
            ->with('i',(request()-> input('page',1)-1)*5)->with('catList', $catList);

    }

    public function create()
    {
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('Items.create')->with('catList', $catList);
    }

    public function sort(){
        $categories= Category::get();
        $category = Category::findOrFail(Input::get('id'));
        $items = Item::with('category')->where('category_id', '=' , $category->id)->Paginate(5);
        //$items = DB::table('items')->where('items.name', 'like', '%'. $search . '%')->Paginate(5);
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('Items.index',compact('categories'))->with($items)->with('catList', $catList);

    }


//    public function sort()
//    {
//      //  $categories = Category::get();
//        $category = Category::findOrFail(Input::get('id'));
//        $items = Item::with('category')->where('items.category_id', '=' ,  $category->id )->get()->Paginate(5);
//        $catList = DB::table('categories')->pluck('id', 'name');
//        return View('Items.index',compact('items'))->with('catList', $catList);
//    }

//    public function sort(){
//        if($this->request->input('category')){
//
//            $category_type=$this->request->input('category');
//            $items = DB::table('items')
//                    ->selectRaw('*')
//                    ->join('categories','items.category_id', '=' , 'categories.id')
//                    ->get()->toArray();
//
//        }
//    }

//    public function sort(){
//            $category_type=$this->input('category');
//            $items = DB::table('items')
//                    ->selectRaw('*')
//                    ->join('categories','items.category_id', '=' , 'categories.id')
//                    ->where('items.category_id', (int)$this->request->input('category'))
//                    ->get()->toArray();
//
//        return view('Items.index',['items'=> $items, 'category'=>$category_type ]);
//    }


    public  function search(Request $request){
        $search = $request->get('search');
        $items = Item::with('category')->where('name', 'like', '%'.$search.'%')->Paginate(5);
       //$items = DB::table('items')->where('items.name', 'like', '%'. $search . '%')->Paginate(5);
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('Items.index',['items' => $items])->with('catList', $catList);
    }

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

    public function edit(Item $item)
    {
        $catList = DB::table('categories')->pluck('id', 'name');
        return view('Items.edit', compact('item'))->with('catList', $catList);
    }

    public function update(Request $request, Item $item)
    {
        $request->validate([
            'type' => 'required',
            'name' => 'required',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

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
