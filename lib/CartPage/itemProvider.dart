import 'package:menu_app/Regular/regularItems.dart';

//class created to create a list of food items to be updated and later fed into sink

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<FoodItem> foodItems = [];

  List<FoodItem> addToList(FoodItem foodItem) {
  
     bool isPresent = false;

    if (foodItems.length > 0) {
      for (int i = 0; i < foodItems.length; i++) {
        if (foodItems[i].id == foodItem.id) {
          increaseItemQuantity(foodItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        foodItems.add(foodItem);
      }
    } else {
      foodItems.add(foodItem);
    }

    
    return foodItems;
    
  }

  List<FoodItem> removeFromList(FoodItem foodItem) {
    //remove it from the list
    foodItems.remove(foodItem);
  
    return foodItems;
  }

  void increaseItemQuantity(FoodItem foodItem) => foodItem.incrementQuantity();
  void decreaseItemQuantity(FoodItem foodItem) => foodItem.decrementQuantity();
}

//  if (foodItem.quantity > 1) {
//       //only decrease the quantity
//       decreaseItemQuantity(foodItem);
//     } else {
//       //remove it from the list
//       foodItems.remove(foodItem);
//     }
//     return foodItems;n 