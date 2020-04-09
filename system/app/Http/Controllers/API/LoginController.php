<?php


namespace App\Http\Controllers\API;


use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Login as LoginResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Login;


class LoginController extends BaseController
{
    public function index()
    {
        //get registries
        $logins = Login::all();

        //return collection of registries as a resource . here, collection returns a list of registries
        return LoginResource::collection($logins);
    }

    public function store(Request $request)
    {
        //checking method, if it is put request we gonna have to include in registry_id field
        $login = $request->isMethod('put') ? Login::findorFail($request->login_id) : new Login();

        $login->id = $request->input('login_id');
        $login->username = $request->input('username');
        $login->password = Hash::make($request->input('password'));

        if ($login->save()) {
            return new LoginResource($login);
        }
    }
}

