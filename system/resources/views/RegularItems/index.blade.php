@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>View regular food item</h3>
                <br>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('regCreate')}}">Add regular food item</a>
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
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Image</th>
            <th width="280px">Action</th>
        </tr>

        @foreach($regular_items as $ritem)
            <tr>
                <td>{{++$i}}</td>
                <td>{{$ritem->category_id}}</td>
                <td>{{$ritem->name}}</td>
                <td>{{$ritem->price}}</td>
                <td>{{$ritem->description}}</td>
                <td><img src="{{'foodItems/'.$ritem->image}}" alt="" style="height:60px;width: 60px;"></td>

                <td>
                    <form action="{{route('regDelete',$ritem->id)}}" method="POST">

                        <a class="btn btn-primary" href="{{route('regEdit',$ritem->id)}}">Edit</a>

                        @csrf
                        <button type="submit" class="btn btn-danger" >Delete</button>
                    </form>


                </td>
            </tr>
        @endforeach
    </table>

    {!!$regular_items->links()!!}
    {{--to show pagination links when in blank page also--}}
@endsection
