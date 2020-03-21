<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Resources\Category as CategoryResource;
use App\Category;


class CategoryAPIController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //get categories
        $categories= Category::paginate(10);

        //return collection of categories as a resource . here, collection returns a list of items
        return CategoryResource::collection($categories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //checking method, if it is put request we gonna have to include in category_id field
        $category = $request->isMethod('put') ? Category::findorFail($request -> category_id) : new Category;

        $category->id = $request->input('category_id');
        $category->name = $request->input('name');
        $category->image = $request->input('image');

        if($category->save()){
            return new CategoryResource($category);
        }

    }

    /**
     * Display the specified resource.a
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //get single category
        $category= Category::findorFail($id);

        //return single category as resource
        return new CategoryResource($category);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
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
        //delete single category
        $category= Category::findorFail($id);

        if($category->delete()) {
            return new CategoryResource($category);
        }
    }
}
