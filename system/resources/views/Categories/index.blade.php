@extends('layouts.admin')

@section('content')
   <div class="row" style="margin-left: 90px; margin-right: 100px;">
      <div class="col-lg-12 margin-tb">
         <div class="pull-left">
            <h3>View food category</h3>
             <br>
         </div>
         <div class="pull-right">
            <a class="btn btn-primary" href="{{route('catCreate')}}">Add food category</a>
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
         <th>Name</th>
         <th>Type</th>
         <th width="280px">Action</th>
      </tr>

      @foreach($categories as $category)
      <tr>
         <td>{{++$i}}</td>
         <td>{{$category->name}}</td>
         <td>{{$category->type}}</td>
         <td>
            <form action="{{route('catDelete',$category->id)}}" method="POST">

               <a class="btn btn-primary" href="{{route('catEdit',$category->id)}}">Edit</a>

               @csrf

               <button type="submit" class="btn btn-danger">Delete</button>
            </form>


         </td>
      </tr>
         @endforeach
   </table>

   {!!$categories->links()!!}
   {{--to show pagination links when in blank page also--}}
@endsection
