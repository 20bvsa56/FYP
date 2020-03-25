@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>View banner image</h3>
                <br>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('banCreate')}}">Add banner image</a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{$message}}</p>
        </div>
    @endif

    <table class="table table-bordered table-striped" >
        <tr>
            <th>S.N.</th>
            <th>Image</th>
            <th width="280px">Action</th>
        </tr>

        @foreach($banners as $banner)
            <tr>
                <td>{{++$i}}</td>
                <td><img src="{{'bannerImage/'.$banner->image}}" alt="" style="height:60px;width: 60px;"></td>
                <td>
                    <form action="{{route('banDelete',$banner->id)}}" method="POST">

                        <a class="btn btn-primary" href="{{route('banEdit',$banner->id)}}">Edit</a>

                        @csrf

                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>


                </td>
            </tr>
        @endforeach
    </table>

    {!!$banners->links()!!}
    {{--to show pagination links when in blank page also--}}
@endsection
