@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>Edit food category</h3>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('catIndex')}}">Back</a>
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
        <form action="{{route('catUpdate',$category->id)}}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="name" value="{{$category->name}}" placeholder="Enter food category name">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Type">Type</label>
                <input type="text" class="form-control" name="type" value="{{$category->type}}" placeholder="Enter food category type">
                <small class="form-text text-muted">Ex: Special, Regular etc.</small>
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