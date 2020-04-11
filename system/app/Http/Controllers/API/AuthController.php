<?php
//
//
//namespace App\Http\Controllers\API;
//
//use App\User;
//use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
//use Illuminate\Support\Facades\Auth;
//
//
//class AuthController extends Controller
//{
//
////    public function __construct()
////    {
//////        $this->middleware('auth:staff');
////        $this->middleware('guest:staff')->except('logout');
////    }
//
//    public function register(Request $request){
//        $validatedData = $request->validate([
//            'name'=>'required|max:20',
//            'email'=> 'email|required|unique:users',
//            'password'=> 'required'
//        ]);
//
//        $validatedData['password'] = bcrypt($request->password);
//
//        $staff = User::create($validatedData);
//
//       return response(['staff'=>$staff]);
//    }
//
//    public function login()
//    {
//        $log=request(['email', 'password']);
//        if (auth::attempt(request(['email', 'password'])) == false) {
//           return response(['Invalid Credentials.']);
//        }
//         return response(['data'=>$log]);
//         return response(['Login Successful.']);
//
//
//       // if (Auth::guard('staff')->attempt(['email' => $request->email, 'password' => $request->password], $request->get('remember')))
//    }
//}
