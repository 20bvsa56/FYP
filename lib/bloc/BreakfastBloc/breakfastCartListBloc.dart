// import 'dart:async';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:menu_app/cart/breakfastFoodItem.dart';
// import 'package:rxdart/rxdart.dart';

// import 'breakfastProvider.dart'; // adds additional capabilities to Dart Streams and StreamControllers.

// class BreakfastCartListBloc extends BlocBase{
//   BreakfastCartListBloc();

//   BreakfastCartProvider breakfastProvider =
//       BreakfastCartProvider(); //initalizing special cart provider class
//     //controller
//   var _listController = BehaviorSubject<List<BreakfastFoodItem>>.seeded(
//       []); //seeded is for default starting value for the stream
// //BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
//   //output
//   Stream<List<BreakfastFoodItem>> get listStream => _listController.stream;

//   //input
//   Sink<List<BreakfastFoodItem>> get listSink => _listController.sink;

//   //below defining business logic logic below or methods
// //method to add food items to the list
//   addToList(BreakfastFoodItem breakfastFoodItem) {
//     listSink.add(breakfastProvider.addToList(breakfastFoodItem));
//   }

// //method to remove food items from the list
//   removeFromList(BreakfastFoodItem breakfastFoodItem) {
//     listSink.add(breakfastProvider.removeFromList(breakfastFoodItem));
//   }

// //dispose will be called automatically by closing its streams
// //dispose is used to prevent from memory leak
//   @override
//   void dispose() {
//     _listController.close();
//     super.dispose();
//   }
// }

