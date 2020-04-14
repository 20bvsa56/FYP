@extends('layouts.admin')

@section('content')
   <div class="row" style="margin-left: 90px; margin-right: 100px;">
      <div class="col-lg-12 margin-tb">
         <div class="pull-left">
            <h3>View menu category</h3>
             <br>
         </div>
         <div class="pull-right">
            <a class="btn btn-primary" href="{{route('catCreate')}}">Add menu category</a>
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
         <th>Image</th>
         <th width="280px">Action</th>
      </tr>

      @foreach($categories as $category)
      <tr>
         <td>{{++$i}}</td>
         <td>{{$category->name}}</td>
          <td><img src="{{'categories/'.$category->image}}" alt="" style="height:60px;width: 60px;"></td>
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
