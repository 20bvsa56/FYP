<?php


namespace App\Http\Controllers\API;

use App\MobileUser;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
//use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{

    public function register(Request $request){
        $validatedData = $request->validate([
           'username'=>'required|max:20',
            'email'=> 'email|required|unique:mobile_users',
            'password'=> 'required'
        ]);

        $validatedData['password'] = bcrypt($request->password);

        $mobile_user = MobileUser::create($validatedData);

//        $accessToken = $mobile_user->createToken('authToken')->accessToken;
       return response(['mobile_user'=>$mobile_user]);
    }

    public function login(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'email|required',
            'password' => 'required'
        ]);


        //if not valid data give error message.api
        if (!auth()->attempt($loginData)) {
            return response(['message' => 'Invalid Credential.']);
        }

        //token generation when data is valid
        $accessToken = auth()->mobile_user()->createToken('authToken')->accessToken;

        return response(['mobile_user ' => auth()->mobile_user(), 'access_token' => $accessToken]);
    }
}
