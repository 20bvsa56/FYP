@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>Add food item</h3>
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
        <form action="{{route('itemStore')}}" method="POST">
            @csrf
            <div class="form-group">
                <label for="catID">Category ID</label>
                <input type="text" class="form-control" name="catID" placeholder="Insert food item category id">
            </div>
            <div class="form-group">
                <label for="Title">Title</label>
                <input type="text" class="form-control" name="title" placeholder="Enter food item title">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="name" placeholder="Enter food item name">
                <small class="form-text text-muted">Ex: Mo:mo, Burger etc.</small>
            </div>
            <div class="form-group">
                <label for="Price">Price</label>
                <input type="text" class="form-control" name="price" placeholder="Enter food item price">
            </div>
            <div class="form-group">
                <label for="Image">Image</label>
                <input type="text" class="form-control" name="image" placeholder="Insert food item image">
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