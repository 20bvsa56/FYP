import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/cart/dinnerFoodItem.dart';
import 'package:rxdart/rxdart.dart';

import 'dinnerProvider.dart';
 // adds additional capabilities to Dart Streams and StreamControllers.

class DinnerCartListBloc extends BlocBase {
  DinnerCartListBloc();

  DinnerCartProvider dinnerProvider =
      DinnerCartProvider(); //initalizing special cart provider class
  //controller
  var _listController = BehaviorSubject<List<DinnerFoodItem>>.seeded(
      []); //seeded is for default starting value for the stream
//BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
  //output
  Stream<List<DinnerFoodItem>> get listStream => _listController.stream;

  //input
  Sink<List<DinnerFoodItem>> get listSink => _listController.sink;

  //below defining business logic logic below or methods
//method to add food items to the list
  addToList(DinnerFoodItem dinnerFoodItem) {
    listSink.add(dinnerProvider.addToList(dinnerFoodItem));
  }

//method to remove food items from the list
  removeFromList(DinnerFoodItem dinnerFoodItem) {
    listSink.add(dinnerProvider.removeFromList(dinnerFoodItem));
  }

//dispose will be called automatically by closing its streams
//dispose is used to prevent from memory leak
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
