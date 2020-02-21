import 'package:menu_app/Cart/foodItem.dart';


class CartProvider{
  List <FoodItem> foodItems =[];

  List<FoodItem> addToList(FoodItem foodItem){
    foodItems.add(foodItem);
    return foodItems;
  }

  List<FoodItem> removeFromList(FoodItem foodItem){
    foodItems.remove(foodItem);
    return foodItems;
  }
}