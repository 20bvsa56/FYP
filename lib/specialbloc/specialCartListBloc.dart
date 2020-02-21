import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/Cart/specialFoodItem.dart';
import 'package:menu_app/specialbloc/specialProvider.dart';
import 'package:rxdart/rxdart.dart'; // adds additional capabilities to Dart Streams and StreamControllers.

class SpecialCartListBloc extends BlocBase{
  SpecialCartListBloc();

  SpecialCartProvider specialProvider= SpecialCartProvider();//initalizing special cart provider class
  var _listController = BehaviorSubject<List<SpecialFoodItem>>.seeded([]);//default starting value for the stream 
  //output
  Stream<List<SpecialFoodItem>> get listStream => _listController.stream;
  //input
  Sink<List<SpecialFoodItem>> get listSink => _listController.sink;
 
//business logic

//method to add food items to the list
addToList(SpecialFoodItem specialFoodItem){
  listSink.add(specialProvider .addToList(specialFoodItem));
}

//method to remove food items from the list
removeFromList(SpecialFoodItem specialFoodItem){
  listSink.add(specialProvider.removeFromList(specialFoodItem));
}

//dispose will be called automatically by closing its streams
@override 
void dispose(){
  _listController.close();
  super.dispose(); 
}

}