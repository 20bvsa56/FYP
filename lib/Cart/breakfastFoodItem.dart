import 'package:flutter/cupertino.dart';

BreakfastFoodItemList brefoodItemList= BreakfastFoodItemList(breakfastFoodItems: [
BreakfastFoodItem(
  breid: 1,
  brename:'Plain Toast & Butter or Jam',
  bredescription:'Toast, Butter, Jam',
  breprice:150,
  breimage:'images/jam.jpeg',
),
BreakfastFoodItem(
  breid: 2,
  brename:'Hot Oatmeal',
  bredescription:'Peanut butter, Quaker oats, Honey, Cinnamon',
  breprice:180,
  breimage:'images/oatmeal.jpg',
),
BreakfastFoodItem(
  breid: 3,
  brename:'Croissant',
  bredescription:'Instant yeast, Egg, Whole milk',
  breprice:110,
  breimage:'images/Croissant.jpg',
),
BreakfastFoodItem(
  breid: 4,
  brename:'Scrambled Eggs',
  bredescription:'Butter, Milk, Eggs',
  breprice:120,
  breimage:'images/ScrambledEggs.jpeg',
),
BreakfastFoodItem(
  breid: 5,
  brename:'Stuffed Omelete',
  bredescription:'Chedar cheese, Red bell pepper, Baby spinach, Eggs',
  breprice:150,
  breimage:'images/StuffedOmelete.jpg',
),
BreakfastFoodItem(
  breid: 6,
  brename:'Cinnamon Rolls',
  bredescription:'Cream cheese, Brown sugar, Powdered sugar, Butter',
  breprice:150,
  breimage:'images/CinnamonRolls.jpeg',
),
]);


class BreakfastFoodItemList{
//single member variable
List<BreakfastFoodItem> breakfastFoodItems;

BreakfastFoodItemList({
  @required this.breakfastFoodItems
});
}

class BreakfastFoodItem{
  int breid;
  String brename;
  String bredescription;
  int breprice;
  String breimage;
  int brequantity;

//creating constructor and initializing the variables.
  BreakfastFoodItem({
    @required this.breid,
    @required this.brename,
    @required this.bredescription,
    @required this.breprice,
    @required this.breimage,

    this.brequantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void breakfastIncrementQuantity(){
    this.brequantity=this.brequantity + 1;
  }

  void breakfastDecrementQuantity(){
    this.brequantity=this.brequantity - 1;
  }
}