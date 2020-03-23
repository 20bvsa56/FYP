@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>View beverage item</h3>
                <br>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('bevCreate')}}">Add beverage item</a>
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
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Image</th>
            <th width="280px">Action</th>
        </tr>

        @foreach($beverages as $beverage)
            <tr>
                <td>{{++$i}}</td>
                <td>{{$beverage->name}}</td>
                <td>{{$beverage->description}}</td>
                <td>{{$beverage->price}}</td>
                <td><img src="{{'foodItems/'.$beverage->image}}" alt="" style="height:60px;width: 60px;"></td>

                <td>
                    <form action="{{route('bevDelete',$beverage->id)}}" method="POST">

                        <a class="btn btn-primary" href="{{route('bevEdit',$beverage->id)}}">Edit</a>

                        @csrf
                        <button type="submit" class="btn btn-danger" >Delete</button>
                    </form>


                </td>
            </tr>
        @endforeach
    </table>

    {!!$beverages->links()!!}
    {{--to show pagination links when in blank page also--}}
@endsection
