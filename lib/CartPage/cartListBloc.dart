import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'package:rxdart/rxdart.dart';
import 'itemProvider.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  CartProvider itemProvider =
      CartProvider(); //initalizing special cart provider class
  //controller
  var _listController = BehaviorSubject<List<FoodItem>>.seeded(
      []); //seeded is for default starting value for the stream
//BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
  //output
  Stream<List<FoodItem>> get listStream => _listController.stream;

  //input
  Sink<List<FoodItem>> get listSink => _listController.sink;

  //below defining business logic below or methods
//method to add food items to the list
//updated list of food items will come
  addToList(FoodItem foodItem) {
    listSink.add(itemProvider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(itemProvider.removeFromList(foodItem));
  }


//dispose will be called automatically by closing its streams
//dispose is used to prevent from memory leak
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}


