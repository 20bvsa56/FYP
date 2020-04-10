<?php


namespace App\Http\Controllers\API;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{

    public function register(Request $request){
        $validatedData = $request->validate([
            'name'=>'required|max:20',
            'email'=> 'email|required|unique:users',
            'password'=> 'required'
        ]);

        $validatedData['password'] = bcrypt($request->password);

        $user = User::create($validatedData);

       return response(['user'=>$user]);
    }

    public function login()
    {
        $log=request(['email', 'password']);
        if (auth()->attempt(request(['email', 'password'])) == false) {
           return response(['Invalid Credentials.']);
        }
         return response(['data'=>$log]);
         return response(['Login Successful.']);
    }
}
