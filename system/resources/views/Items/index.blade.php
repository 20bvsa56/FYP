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

    <div class="row" >
        <div class="pull-left">
            <form action="/itemSort" method="get" style="margin-left: 380px;">
                <div class="input-group">
                    <select class="form-control" id="sort" name="sort" >
                        <option value="id" selected="selected">Sort By Category</option>
                        @foreach ($catList as $name => $id)
                            <option value="{{$id}}">{{$name}}</option>
                        @endforeach
                    </select>
                    <span class="input-group-prepend">
                  <button type="submit" class="btn btn-primary">Sort</button>
              </span>
                </div>
            </form>
        </div>

        <div class="pull-right">
            <form action="/itemSearch" method="get" style="margin-left: 30px; width: 280px">
                <div class="input-group" >
                    <input type="search" class="form-control" name="search" placeholder="----Search Item----">
                    <span class="input-group-prepend">
                  <button type="submit" class="btn btn-primary">Search</button>
              </span>
                </div>
            </form>
        </div>
    </div>

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
                <td><img src="{{'foodItems/'.$item->image}}" alt="" style="height:80px;width: 80px;"></td>

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
