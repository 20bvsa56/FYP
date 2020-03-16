@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>Edit food item</h3>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('itemIndex')}}">Back</a>
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
        <form action="{{route('itemUpdate','$item->id')}}" method="POST">
            @csrf
            <div class="form-group">
                <label for="Category">Category</label>
                <input type="text" class="form-control" name="name" value="{{$item->catID}}" placeholder="Enter food item category">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Title">Title</label>
                <input type="text" class="form-control" name="title" value="{{$item->title}}" placeholder="Enter food item title">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="name" value="{{$item->name}}" placeholder="Enter food item name">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Type">Price</label>
                <input type="text" class="form-control" name="type" value="{{$item->price}}" placeholder="Enter food item price">
                <small class="form-text text-muted">Ex: Special, Regular etc.</small>
            </div>
            <div class="input-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="image" value="{{$item->image}}">
                    <label class="custom-file-label">Choose food item image</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{$message}}</p>
        </div>
    @endif

@endsection