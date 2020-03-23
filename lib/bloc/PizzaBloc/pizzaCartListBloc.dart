// import 'dart:async';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:menu_app/bloc/PizzaBloc/pizzaProvider.dart';
// import 'package:menu_app/cart/pizzaFoodItem.dart';
// import 'package:rxdart/rxdart.dart';
//  // adds additional capabilities to Dart Streams and StreamControllers.

// class PizzaCartListBloc extends BlocBase{
//   PizzaCartListBloc();

//   PizzaCartProvider pizzaProvider =
//       PizzaCartProvider(); //initalizing special cart provider class
//     //controller
//   var _listController = BehaviorSubject<List<PizzaFoodItem>>.seeded(
//       []); //seeded is for default starting value for the stream
// //BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
//   //output
//   Stream<List<PizzaFoodItem>> get listStream => _listController.stream;

//   //input
//   Sink<List<PizzaFoodItem>> get listSink => _listController.sink;

//   //below defining business logic logic below or methods
// //method to add food items to the list
//   addToList(PizzaFoodItem pizzaFoodItem) {
//     listSink.add(pizzaProvider.addToList(pizzaFoodItem));
//   }

// //method to remove food items from the list
//   removeFromList(PizzaFoodItem pizzaFoodItem) {
//     listSink.add(pizzaProvider.removeFromList(pizzaFoodItem));
//   }

// //dispose will be called automatically by closing its streams
// //dispose is used to prevent from memory leak
//   @override
//   void dispose() {
//     _listController.close();
//     super.dispose();
//   }
// }

