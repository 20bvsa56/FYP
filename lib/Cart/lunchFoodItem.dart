import 'package:flutter/cupertino.dart';

LunchFoodItemList lunfoodItemList= LunchFoodItemList(lunchFoodItems: [
LunchFoodItem(
  lunid: 1,
  lunname:'Fish & Chips',
  lunprice: 200,
  lunimage:'images/FishChips.jfif',
  lundescription: 'Potatoes, Cold fillets, Eggs, Baking powder, White fish ',
),
LunchFoodItem(
  lunid: 2,
  lunname:'Pasta',
  lunprice: 200,
  lunimage:'images/Pasta2.jpg',
  lundescription: 'Pasta, Green peas, Bell pepper',
),
LunchFoodItem(
  lunid: 3,
  lunname:'Nachos',
  lunprice: 150,
  lunimage:'images/Nachos.jpeg',
  lundescription: 'Ground beef, Refried beans, Sour cream, Corn, Hot sauce',
),
LunchFoodItem(
  lunid: 4,
  lunname:'Chicken Wings',
  lunprice: 250,
  lunimage:'images/wings.jpg',
  lundescription: 'Chicken wings, Olive oil, Chilli powder, Garlic powder, Sweet soy sauce',
),
LunchFoodItem(
  lunid: 5,
  lunname:'Fries',
  lunprice: 120,
  lunimage:'images/fries.jfif',
  lundescription: 'Potato, Oil',
),
LunchFoodItem(
  lunid: 6,
  lunname:'Hotdog',
  lunprice: 220,
  lunimage:'images/hotdog.jfif',
  lundescription: 'Egg white, Pound pork fat, Ground mustard seed, Garlic',
),

]);

class LunchFoodItemList{
//single member variable
List<LunchFoodItem> lunchFoodItems;

LunchFoodItemList({
  @required this.lunchFoodItems
});
}

class LunchFoodItem{
  int lunid;
  String lunname;
  int lunprice;
  String lunimage;
  int lunquantity;
  String lundescription;

//creating constructor and initializing the variables.
  LunchFoodItem({
    @required this.lunid,
    @required this.lunname,
    @required this.lunprice,
    @required this.lunimage,
     @required this.lundescription,


    this.lunquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void lunchIncrementQuantity(){
    this.lunquantity=this.lunquantity + 1;
  }

  void lunchDecrementQuantity(){
    this.lunquantity=this.lunquantity - 1;
  }
}



