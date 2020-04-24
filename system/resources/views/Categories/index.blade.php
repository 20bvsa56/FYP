@extends('layouts.admin')

@section('content')
   <div class="row" style="margin-left: 90px; margin-right: 100px;">

      <div class="col-lg-12 margin-tb">

         <div class="pull-left">
             <a class="btn btn-primary" href="{{route('catIndex')}}">Back</a>
            <h3 style="margin-left: 420px">View menu category</h3>
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
   <div class="col-md-6" style="margin-left: 490px;width: 340px">

       <form action="/categorySearch" method="get">
           <div class="input-group" >
               <input type="search" class="form-control" name="search" placeholder="----Search Category----">
               <span class="input-group-prepend">
                  <button type="submit" class="btn btn-primary">Search</button>
              </span>
           </div>
       </form>
   </div>

   <br>
   <table class="table table-bordered table-striped" >

      <tr>
         <th>S.N.</th>
         <th>Name</th>
         <th>Image</th>
         <th width="280px">Action</th>
      </tr>

      @foreach($categories as $category)
      <tr>
{{--         <td>{{++$i}}</td>--}}
          <td>{{$category->id}}</td>
         <td>{{$category->name}}</td>
          <td><img src="{{'categories/'.$category->image}}" alt="" style="height:80px;width: 80px;"></td>
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
