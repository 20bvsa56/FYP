import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/cart/beverageFoodItem.dart';
import 'package:rxdart/rxdart.dart';

import 'beverageProvider.dart'; // adds additional capabilities to Dart Streams and StreamControllers.

class BeverageCartListBloc extends BlocBase{
  BeverageCartListBloc();

  BeverageCartProvider beverageProvider =
      BeverageCartProvider(); //initalizing special cart provider class
    //controller
  var _listController = BehaviorSubject<List<BeverageFoodItem>>.seeded(
      []); //seeded is for default starting value for the stream
//BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
  //output
  Stream<List<BeverageFoodItem>> get listStream => _listController.stream;

  //input
  Sink<List<BeverageFoodItem>> get listSink => _listController.sink;

  //below defining business logic logic below or methods
//method to add food items to the list
  addToList(BeverageFoodItem beverageFoodItem) {
    listSink.add(beverageProvider.addToList(beverageFoodItem));
  }

//method to remove food items from the list
  removeFromList(BeverageFoodItem beverageFoodItem) {
    listSink.add(beverageProvider.removeFromList(beverageFoodItem));
  }

//dispose will be called automatically by closing its streams
//dispose is used to prevent from memory leak
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}

