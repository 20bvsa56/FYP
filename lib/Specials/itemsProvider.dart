import 'items.dart';

//class created to create a list of food items to be updated and later fed into sink

class SpecialCartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<Items> specialitems = [];

  List<Items> addToList(Items items) {
    bool isPresent = false;

    if (specialitems.length > 0) {
      for (int i = 0; i < specialitems.length; i++) {
        if (specialitems[i].id == items.id) {
          increaseItemQuantity(items);
          isPresent = true;
        //break;
        } else {
          specialitems.add(items);
         // isPresent = false;
         // break;
        }
      }

      if (isPresent == false) {
        specialitems.add(items);
      }
    } else {
      specialitems.add(items);
    }

    return specialitems;
  }

  List<Items> removeFromList(Items items) {
    if (items.quantity > 1) {
      //only decrease the quantity
      decreaseItemQuantity(items);
    } else {
      //remove it from the list
      specialitems.remove(items);
    }
    return specialitems;
  }

  void increaseItemQuantity(Items items) => items.incrementQuantity();
  void decreaseItemQuantity(Items items) => items.decrementQuantity();
}