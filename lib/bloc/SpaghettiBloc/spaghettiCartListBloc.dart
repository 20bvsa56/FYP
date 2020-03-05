import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/bloc/SpaghettiBloc/spaghettiProvider.dart';
import 'package:menu_app/cart/spaghettiFoodItem.dart';
import 'package:rxdart/rxdart.dart';
 // adds additional capabilities to Dart Streams and StreamControllers.

class SpaghettiCartListBloc extends BlocBase{
  SpaghettiCartListBloc();

  SpaghettiCartProvider spaghettiProvider =
      SpaghettiCartProvider(); //initalizing special cart provider class
    //controller
  var _listController = BehaviorSubject<List<SpaghettiFoodItem>>.seeded(
      []); //seeded is for default starting value for the stream
//BehaviorSubject is a special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
  //output
  Stream<List<SpaghettiFoodItem>> get listStream => _listController.stream;

  //input
  Sink<List<SpaghettiFoodItem>> get listSink => _listController.sink;

  //below defining business logic logic below or methods
//method to add food items to the list
  addToList(SpaghettiFoodItem spaghettiFoodItem) {
    listSink.add(spaghettiProvider.addToList(spaghettiFoodItem));
  }

//method to remove food items from the list
  removeFromList(SpaghettiFoodItem spaghettiFoodItem) {
    listSink.add(spaghettiProvider.removeFromList(spaghettiFoodItem));
  }

//dispose will be called automatically by closing its streams
//dispose is used to prevent from memory leak
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}

