@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>View staff role</h3>
                <br>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('roleCreate')}}">Add staff role</a>
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
            <th>Title</th>
            <th width="280px">Action</th>
        </tr>

        @foreach($roles as $role)
            <tr>
                <td>{{++$i}}</td>
                <td>{{$role->title}}</td>
                <td>
                    <form action="{{route('roleDelete',$role->id)}}" method="POST">

                        <a class="btn btn-primary" href="{{route('roleEdit',$role->id)}}">Edit</a>

                        @csrf
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>


                </td>
            </tr>
        @endforeach
    </table>

    {!!$roles->links()!!}
    {{--to show pagination links when in blank page also--}}
@endsection
