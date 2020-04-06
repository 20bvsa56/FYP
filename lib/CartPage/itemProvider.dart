import 'package:menu_app/Regular/regularItems.dart';


//class created to create a list of food items to be updated and later fed into sink

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
 List<RegularItems> fooditems = [];

  List<RegularItems> addToList(RegularItems ritems) {
    bool isPresent = false;  

    if(fooditems.length > 0){
      for(int i = 0; i < fooditems.length; i++){
        if(fooditems[i].id == ritems.id){
            increaseItemQuantity(ritems);
            isPresent = true;
            break;
            
        }else{
          isPresent = false;
        }
      }
      if(!isPresent){
        fooditems.add(ritems);
      }
    }
    
    else{
      fooditems.add(ritems);
    }

    return fooditems;
  }

  void increaseItemQuantity(RegularItems ritems) => ritems.incrementQuantity();
  void decreaseItemQuantity(RegularItems ritems) => ritems.decrementQuantity();

  List<RegularItems> removeFromList(RegularItems ritems) {
    fooditems.remove(ritems);
    return fooditems;
  }

}