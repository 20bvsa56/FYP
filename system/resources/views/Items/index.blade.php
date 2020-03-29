@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>View special food item</h3>
                <br>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('itemCreate')}}">Add special food item</a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{$message}}</p>
        </div>
    @endif

    <table class="table table-bordered table-striped">
        <tr>
            <th>S.N.</th>
            <th>Category</th>
            <th>Title</th>
            <th>Name</th>
            <th>Price</th>
            <th>Image</th>
            <th width="280px">Action</th>
        </tr>

        @foreach($items as $item)
            <tr>
                <td>{{++$i}}</td>
                <td>{{$item->category->name}}</td>
                <td>{{$item->title}}</td>
                <td>{{$item->name}}</td>
                <td>{{$item->price}}</td>
                <td><img src="{{'foodItems/'.$item->image}}" alt="" style="height:60px;width: 60px;"></td>

                <td>
                    <form action="{{route('itemDelete',$item->id)}}" method="POST">

                        <a class="btn btn-primary" href="{{route('itemEdit',$item->id)}}">Edit</a>

                        @csrf
                        <button type="submit" class="btn btn-danger" >Delete</button>
                    </form>


                </td>
            </tr>
        @endforeach
    </table>

    {!!$items->links()!!}
    {{--to show pagination links when in blank page also--}}
@endsection
