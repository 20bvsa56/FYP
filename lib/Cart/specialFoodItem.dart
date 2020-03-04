import 'package:flutter/cupertino.dart';

SpecialFoodItemList sfoodItemList= SpecialFoodItemList(specialFoodItems: [
SpecialFoodItem(
  sid: 1,
  stitle:'Beverage',
  sname:'Valencia Fizz',
  sprice: 250,
  simage:'images/ValenciaFizz.jpg',
),
SpecialFoodItem(
  sid: 2,
  stitle:'Breakfast',
  sname:'Blueberry Pancake',
  sprice: 400,
  simage:'images/pancake.jpg',
),
SpecialFoodItem(
  sid: 3,
  stitle:'Lunch',
  sname:'Bacon Double Cheeseburger Grilled Cheese Sandwich',
  sprice: 320,
  simage:'images/bacon_cheese.jpg',
),
SpecialFoodItem(
  sid: 4,
  stitle:'Dinner',
  sname:'Nepali Thakali Khana Set',
  sprice: 400,
  simage:'images/thakali.jpeg',
),
]);

class SpecialFoodItemList{
//single member variable
List<SpecialFoodItem> specialFoodItems;

SpecialFoodItemList({
  @required this.specialFoodItems
});
}

class SpecialFoodItem{
  int sid;
  String stitle;
  String sname;
  int sprice;
  String simage;
  int squantity;

//creating constructor and initializing the variables.
  SpecialFoodItem({
    @required this.sid,
    @required this.stitle,
    @required this.sname,
    @required this.sprice,
    @required this.simage,

    this.squantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void specialIncrementQuantity(){
    this.squantity=this.squantity + 1;
  }

  void specialDecrementQuantity(){
    this.squantity=this.squantity - 1;
  }
}



