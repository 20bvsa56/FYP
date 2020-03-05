import 'package:menu_app/cart/dinnerFoodItem.dart';

//class created to create a list of food items to be updated and later fed into sink
class DinnerCartProvider{
  List <DinnerFoodItem> dinnerFoodItems =[]; //creating list of SpecialFoodItem and initializing with empty list.
  
  //now adding received food items to the list initalized above.
  List<DinnerFoodItem> addToList(DinnerFoodItem dinnerFoodItem){ 
    dinnerFoodItems.add(dinnerFoodItem);
    return dinnerFoodItems; // return newly updated list
  }

  //now removing food items from the list.
  List<DinnerFoodItem> removeFromList(DinnerFoodItem dinnerFoodItem){
    dinnerFoodItems.remove(dinnerFoodItem);
    return dinnerFoodItems;// return newly updated list
  }
} 