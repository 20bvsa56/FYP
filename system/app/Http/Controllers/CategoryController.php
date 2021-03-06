<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use DB;
use File;

class CategoryController extends Controller
{

    public function __construct()
    {
//        $this->middleware('auth');
    }

    public function index()
    {
        //categories var stores data from the db
        $categories=Category::latest()->Paginate(5);
        return view('Categories.index',compact('categories'))
            ->with('i',(request()-> input('page',1)-1)*5);
        //compact stores vdata in key and value form
    }

    public  function search(Request $request){
        $search = $request->get('search');
        $categories = DB::table('categories')->where('name', 'like', '%'. $search . '%')->Paginate(5);
        return view('Categories.index',['categories' => $categories]);
    }

    public function create()
    {
        return view('Categories.create');
    }


    public function show(Category $category)
    {
        //
    }


    public function edit(Category $category)
    {
        //dd($category);
        return view('Categories.edit', compact('category'));
    }


    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $category->id = $request->id;
        $category->name = $request->name;
        $category->image = $request->image;

        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('foodItems/'), $imageName);
        $category->image = $imageName;

        $category->update();

        return redirect()->route('catIndex')
            ->with('success','Menu category updated successfully.');

    }

    public function destroy(Category $category)
    {
        /*$category= Category::find($category['id']);*/
        $category = Category::find($category->id);

        if ($category->image) {
            File::delete(public_path('foodItems/'.$category->image));
        }
        $category->delete();

        return redirect()->route('catIndex')
            ->with('success','Menu category deleted successfully.');
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,jfif|max:2048',
        ]);
        $category = new Category();
        $category->id = $request->id;
        $category->name = $request->name;
        $category->image = $request->image;


        $imageName = time() . '.' . request()->image->getClientOriginalExtension();
        request()->image->move(public_path('categories/'), $imageName);
        $category->image = $imageName;

        $category->save();

        return redirect()->route('catIndex')
            ->with('success','Menu category added successfully.');
    }
}
