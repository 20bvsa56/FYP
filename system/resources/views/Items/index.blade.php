@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <a class="btn btn-primary" href="{{route('itemIndex')}}">Back</a>
                <h3 style="margin-left: 420px">View food item</h3>
                <br>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('itemCreate')}}">Add food item</a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{$message}}</p>
        </div>
    @endif


{{--    <form action="/sort" method="get" style="margin-left: 250px;width: 300px">--}}
{{--        <div class="input-group">--}}
{{--            <select class="form-control" id="category_id" name="category_id" >--}}
{{--                <option>Sort By Category</option>--}}
{{--                @foreach ($catList as $id => $name)--}}
{{--                    <option value="{{$name}}" >{{$id}}</option>--}}
{{--                @endforeach--}}
{{--            </select>--}}
{{--            <span class="input-group-prepend">--}}
{{--                  <button type="submit" class="btn btn-primary">Search</button>--}}
{{--              </span>--}}
{{--        </div>--}}
{{--    </form>--}}

    <form action="/itemSearch" method="get" style="margin-left: 500px;width: 280px">
        <div class="input-group" >
            <input type="search" class="form-control" name="search" placeholder="----Search Item----">
            <span class="input-group-prepend">
                  <button type="submit" class="btn btn-primary">Search</button>
              </span>
        </div>
    </form>
<br>

    <table class="table table-bordered table-striped">
        <tr>
            <th>S.N.</th>
            <th>Category</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Type</th>
            <th>Image</th>
            <th width="280px">Action</th>
        </tr>

        @foreach($items as $item)
            <tr>
{{--                <td>{{++$i}}</td>--}}
                <td>{{$item->id}}</td>
                <td>{{$item->category->name}}</td>
                <td>{{$item->name}}</td>
                <td>{{$item->price}}</td>
                <td>{{$item->description}}</td>
                <td>{{$item->type}}</td>
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
