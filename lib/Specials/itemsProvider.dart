import 'items.dart';

//class created to create a list of food items to be updated and later fed into sink

class SpecialCartProvider{
  List <Items> specialitems =[]; //creating list of SpecialFoodItem and initializing with empty list.
  
  //now adding received food items to the list initalized above.
  List<Items> addToList(Items items){ 
    specialitems.add(items);
    return specialitems; // return newly updated list
  }

  //now removing food items from the list.
  List<Items> removeFromList(Items items){
    specialitems.remove(items);
    return specialitems;// return newly updated list
  }


}  