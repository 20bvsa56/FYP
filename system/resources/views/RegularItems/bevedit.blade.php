@extends('layouts.admin')

@section('content')
    <div class="row" style="margin-left: 90px; margin-right: 100px;">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h3>Edit beverage item</h3>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{route('bevIndex')}}">Back</a>
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
        <form action="{{route('bevUpdate',$beverage->id)}}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="name" value="{{$beverage->name}}" placeholder="Enter beverage name">
                <small class="form-text text-muted">Ex: Hot chocolate, Milkshake etc.</small>
            </div>
            <div class="form-group">
                <label for="Description">Description</label>
                <input type="text" class="form-control" name="description" value="{{$beverage->description}}" placeholder="Enter beverage description">
                <small class="form-text text-muted">Ex: Sugar, Cheese Powder, Onion etc.</small>
            </div>
            <div class="form-group">
                <label for="Price">Price</label>
                <input type="text" class="form-control" name="price" value="{{$beverage->price}}" placeholder="Enter beverage price">
                <small class="form-text text-muted">Ex: Special, Regular etc.</small>
            </div>
            <div class="form-group">
                <label>Image</label>
                <input type="file" name="image" id="image" class="form-control" value="{{$beverage->image}}">
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
