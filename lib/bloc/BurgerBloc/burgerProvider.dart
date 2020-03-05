import 'package:menu_app/cart/burgerFoodItem.dart';

//class created to create a list of food items to be updated and later fed into sink
class BurgerCartProvider{
  List <BurgerFoodItem> burgerFoodItems =[]; //creating list of SpecialFoodItem and initializing with empty list.
  
  //now adding received food items to the list initalized above.
  List<BurgerFoodItem> addToList(BurgerFoodItem burgerFoodItem){ 
    burgerFoodItems.add(burgerFoodItem);
    return burgerFoodItems; // return newly updated list
  }

  //now removing food items from the list.
  List<BurgerFoodItem> removeFromList(BurgerFoodItem burgerFoodItem){
    burgerFoodItems.remove(burgerFoodItem);
    return burgerFoodItems;// return newly updated list
  }
} 