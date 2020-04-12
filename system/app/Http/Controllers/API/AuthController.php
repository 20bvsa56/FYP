<?php


namespace App\Http\Controllers\API;

use App\Staff;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{

    public function __construct()
    {
        $this->middleware('guest:staff')->except('logout');
    }

    public function index()
    {
        return view('RegisterStaffs.create');

    }
    public function register(Request $request){
        $validatedData = $request->validate([
            'name'=>'required|max:20',
            'email'=> 'email|required|unique:users',
            'password'=> 'required'
        ]);

        $validatedData['password'] = bcrypt($request->password);

        $staff = Staff::create($validatedData);
        $staff->save();

        return redirect()->route('staffIndex')
            ->with('success','Staff registered successfully.');

    }

    public function login()
    {
        $log = request(['email', 'password']);
        if (Auth::guard('staff')->attempt(request(['email', 'password'])) == false) {
            return response(['Invalid Credentials.']);
        }
        return response(['data' => $log]);
        return response(['Login Successful.']);

    }
}
