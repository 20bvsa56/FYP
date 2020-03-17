<?php

namespace App\Http\Controllers;

use App\Http\Resources\Registration as RegistrationResource;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Registration;

class RegistrationAPIController extends Controller
{
    public function index()
    {
        //get registries
        $registries = Registration::paginate(10);

        //return collection of registries as a resource . here, collection returns a list of registries
        return RegistrationResource::collection($registries);
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
        //checking method, if it is put request we gonna have to include in registry_id field
        $registry = $request->isMethod('put') ? Registration::findorFail($request->registry_id) : new Registration();

        $registry->id = $request->input('registry_id');
        $registry->username = $request->input('username');
        $registry->email = $request->input('email');
        $registry->password = $request->input('password');

        if ($registry->save()) {
            return new RegistrationResource($registry);
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
        //get single registry
        $registry = Registration::findorFail($id);

        //return single registry as resource
        return new RegistrationResource($registry);
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
        //get single registry
        $registry = Registration::findorFail($id);

        if ($registry->delete()) {
            return new RegistrationResource($registry);
        }
    }
}
