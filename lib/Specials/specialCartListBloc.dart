// import 'dart:async';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:rxdart/rxdart.dart';
// import 'items.dart';
// import 'itemsProvider.dart';

// class SpecialCartListBloc extends BlocBase {
//   SpecialCartListBloc();

//   SpecialCartProvider specialProvider =
//       SpecialCartProvider(); //initalizing special cart provider class
//   //controller
//   var _listController = BehaviorSubject<List<Items>>.seeded(
//       []); //seeded is for default starting value for the stream
// //BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
//   //output
//   Stream<List<Items>> get listStream => _listController.stream;

//   //input
//   Sink<List<Items>> get listSink => _listController.sink;

//   //below defining business logic below or methods
// //method to add food items to the list
//   addToList(Items items) {
//     listSink.add(specialProvider.addToList(items));
//   }

// //method to remove food items from the list
//   removeFromList(Items items) {
//     listSink.add(specialProvider.removeFromList(items));
//   }

// //dispose will be called automatically by closing its streams
// //dispose is used to prevent from memory leak
//   @override
//   void dispose() {
//     _listController.close();
//     super.dispose();
//   }
// }
