<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;

class PaymentController extends Controller
{

    public function index()
    {
        $payments=Order::latest()->Paginate(8);
        return view('Payments.index',compact('payments'))
            ->with('i',(request()-> input('page',1)-1)*5);;

    }
}
