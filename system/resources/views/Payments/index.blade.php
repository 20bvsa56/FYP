@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 450px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>View payments details</h3>
                <br>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{$message}}</p>
        </div>
    @endif
    <!DOCTYPE html>
    <html>

    <body>
    <table class="table table-bordered table-striped" >
        <tr>
            <th>S.N.</th>
            <th>Order Number</th>
            <th>Total Amount</th>
            <th>Order Date & Time</th>
        </tr>

        @foreach($payments as $payment)
            <tr>
                <td>{{++$i}}</td>
                <td>{{$payment->id}}</td>
                <td>{{'Rs.' . ' ' . $payment->totalAmount}}</td>
                <td>{{$payment->created_at}}</td>
            </tr>
        @endforeach
    </table>

    </body>
    </html>

    {!!$payments->links()!!}
    {{--to show pagination links when in blank page also--}}
@endsection

