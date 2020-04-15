<?php


namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Payment as PaymentResource;
use App\Payment;
use Illuminate\Http\Request;

class PaymentController extends BaseController
{
    public function index()
    {
        //get items
        $payments = Payment::all();

        //return collection of items as a resource . here, collection returns a list of items
        return PaymentResource::collection($payments);
    }

    public function store(Request $request)
    {
        //checking method, if it is put request we gonna have to include in registry_id field
        $payment = $request->isMethod('put') ? Payment::findorFail($request->payment_id) : new Payment();

        $payment->id = $request->input('payment_id');
        $payment->order_id = $request->input('order_id');
        $payment->tableNo = $request->input('tableNo');
        $payment->totalAmount = $request->input('totalAmount');


        if ($payment->save()) {
            return new PaymentResource($payment);
        }

    }

    public function show($id)
    {
        //get single registry
        $payment = Payment::findorFail($id);

        //return single registry as resource
        return new PaymentResource($payment);
    }

    public function destroy($id)
    {
        //get single registry
        $payment = Payment::findorFail($id);

        if ($payment->delete()) {
            return new PaymentResource($payment);
        }
    }
}

