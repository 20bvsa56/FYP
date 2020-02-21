import 'dart:async';
import 'package:menu_app/Cart/foodItem.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/bloc/provider.dart';
import 'package:rxdart/rxdart.dart'; // adds additional capabilities to Dart Streams and StreamControllers.

class CartListBloc extends BlocBase{
  CartListBloc();

  CartProvider provider= CartProvider();//initalizing cart provider class
  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);//default starting value for the stream 
  //output
  Stream<List<FoodItem>> get listStream => _listController.stream;
  //input
  Sink<List<FoodItem>> get listSink => _listController.sink;
 
//business logic

//method to add food items to the list
addToList(FoodItem foodItem){
  listSink.add(provider.addToList(foodItem));
}

//method to remove food items from the list
removeFromList(FoodItem foodItem){
  listSink.add(provider.removeFromList(foodItem));
}

//dispose will be called automatically by closing its streams
@override 
void dispose(){
  _listController.close();
  super.dispose();
}

}