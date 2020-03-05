import 'package:menu_app/cart/pizzaFoodItem.dart';

//class created to create a list of food items to be updated and later fed into sink

class PizzaCartProvider{
  List <PizzaFoodItem> pizzaFoodItems =[]; //creating list of SpecialFoodItem and initializing with empty list.
  
  //now adding received food items to the list initalized above.
  List<PizzaFoodItem> addToList(PizzaFoodItem pizzaFoodItem){ 
    pizzaFoodItems.add(pizzaFoodItem);
    return pizzaFoodItems; // return newly updated list
  }

  //now removing food items from the list.
  List<PizzaFoodItem> removeFromList(PizzaFoodItem pizzaFoodItem){
    pizzaFoodItems.remove(pizzaFoodItem);
    return pizzaFoodItems;// return newly updated list
  }
} 