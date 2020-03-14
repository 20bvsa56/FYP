@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>Edit staff role</h3>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('roleIndex')}}">Back</a>
            </div>
        </div>
    </div>

    @if ($errors->any())

        <div class="alert alert-danger">
            <strong>Whoops!</strong>There was some error in the input.<br>
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{$error}}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div style="alignment: center; margin-left: 100px; margin-right: 100px;">
        <form action="{{route('roleUpdate',$role->id)}}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="Title">Title</label>
                <input type="text" class="form-control" name="title" value="{{$role->name}}" placeholder="Enter staff role title">
                <small class="form-text text-muted">Ex: Manager, Kitchen staff etc.</small>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{$message}}</p>
        </div>
    @endif

@endsection