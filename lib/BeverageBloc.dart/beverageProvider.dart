import 'package:menu_app/cart/beverageFoodItem.dart';

//class created to create a list of food items to be updated and later fed into sink

class BeverageCartProvider{
  List <BeverageFoodItem> beverageFoodItems =[]; //creating list of SpecialFoodItem and initializing with empty list.
  
  //now adding received food items to the list initalized above.
  List<BeverageFoodItem> addToList(BeverageFoodItem beverageFoodItem){ 
    beverageFoodItems.add(beverageFoodItem);
    return beverageFoodItems; // return newly updated list
  }

  //now removing food items from the list.
  List<BeverageFoodItem> removeFromList(BeverageFoodItem beverageFoodItem){
    beverageFoodItems.remove(beverageFoodItem);
    return beverageFoodItems;// return newly updated list
  }
} 