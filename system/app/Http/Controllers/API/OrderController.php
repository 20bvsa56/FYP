<?php


namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Order as OrderResource;
use App\Order;
use Illuminate\Http\Request;

class OrderController extends BaseController
{
    public function index()
    {
        //get items
        $orders = Order::all();

        //return collection of items as a resource . here, collection returns a list of items
        return OrderResource::collection($orders);
    }

    public function store(Request $request)
    {
        //checking method, if it is put request we gonna have to include in registry_id field
        $order = $request->isMethod('put') ? Order::findorFail($request->order_id) : new Order();

        $order->id = $request->input('order_id');
        $order->tableNo = $request->input('tableNo');
        $order->cart = $request->input('cart');
        $order->status = $request->input('status');
        if ($order->save()) {
            return new OrderResource($order);
        }

    }

    public function show($id)
    {
        //get single registry
        $order = Order::findorFail($id);

        //return single registry as resource
        return new OrderResource($order);
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
        $order = Order::findorFail($id);

        if ($order->delete()) {
            return new OrderResource($order);
        }
    }
}

