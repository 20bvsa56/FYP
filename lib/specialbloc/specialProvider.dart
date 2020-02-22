import 'package:menu_app/Cart/specialFoodItem.dart';

//class created to create a list of food items to be updated and later fed into sink
class SpecialCartProvider{
  List <SpecialFoodItem> specialFoodItems =[]; //creating list of SpecialFoodItem and initializing with empty list.
  
  //now adding received food items to the list initalized above.
  List<SpecialFoodItem> addToList(SpecialFoodItem specialFoodItem){ 
    specialFoodItems.add(specialFoodItem);
    return specialFoodItems; // return newly updated list
  }

  //now removing food items from the list.
  List<SpecialFoodItem> removeFromList(SpecialFoodItem specialFoodItem){
    specialFoodItems.remove(specialFoodItem);
    return specialFoodItems;// return newly updated list
  }
} 