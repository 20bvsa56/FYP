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
        <form action="{{route('itemStore')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label for="Category">Category</label>
                <select class="form-control" id="category_id" name="category_id" >
                    <option>---Select Category---</option>
                    @foreach ($catList as $id => $name)
                        <option value="{{$name}}" >{{$id}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="Title">Title</label>
                <input type="text" class="form-control" name="title" placeholder="Enter food item title">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="name" placeholder="Enter food item name">
                <small class="form-text text-muted">Ex: Beverage, Breakfast etc.</small>
            </div>
            <div class="form-group">
                <label for="Type">Price</label>
                <input type="text" class="form-control" name="price" placeholder="Enter food item price">
                <small class="form-text text-muted">Ex: Special, Regular etc.</small>
            </div>
            <div class="form-group">
                <label>Image</label>
                <input type="file" name="image" id="image" class="form-control">
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
