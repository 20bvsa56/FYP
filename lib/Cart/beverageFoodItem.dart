import 'package:flutter/cupertino.dart';

BeverageFoodItemList bevfoodItemList= BeverageFoodItemList(beverageFoodItems: [
BeverageFoodItem(
  bevid: 1,
  bevname:'Coffee',
  bevdescription:'Water, Milk, Coffee',
  bevprice:80,
  bevimage:'images/coffee.jpeg',
),
BeverageFoodItem(
  bevid: 2,
  bevname:'Lemonade',
  bevdescription:'Water, Sugar, Lemon juice',
  bevprice:120,
  bevimage:'images/lemonade.jpeg',
),
BeverageFoodItem(
  bevid: 3,
  bevname:'Iced Tea',
  bevdescription:'Water, Loose tea, Tea bag',
  bevprice:160,
  bevimage:'images/icedtea.jpeg',
),
BeverageFoodItem(
  bevid: 4,
  bevname:'Milkshake',
  bevdescription:'Vanilla ice cream, Whole milk, Cherry',
  bevprice:150,
  bevimage:'images/milkshake.jpeg',
),
BeverageFoodItem(
  bevid: 5,
  bevname:'Hot Chocolate',
  bevdescription:'Water, Milk, Coffee',
  bevprice:200,
  bevimage:'images/hotchocolate.jpeg',
),
BeverageFoodItem(
  bevid: 6,
  bevname:'Lassi',
  bevdescription:'Rose water, Dry fruits, Saffron, Sugar, Ice cubes',
  bevprice:100,
  bevimage:'images/lassi.jpg',
),
]);


class BeverageFoodItemList{
//single member variable
List<BeverageFoodItem> beverageFoodItems;

BeverageFoodItemList({
  @required this.beverageFoodItems
});
}

class BeverageFoodItem{
  int bevid;
  String bevname;
  String bevdescription;
  int bevprice;
  String bevimage;
  int bevquantity;

//creating constructor and initializing the variables.
  BeverageFoodItem({
    @required this.bevid,
    @required this.bevname,
    @required this.bevdescription,
    @required this.bevprice,
    @required this.bevimage,

    this.bevquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void beverageIncrementQuantity(){
    this.bevquantity=this.bevquantity + 1;
  }

  void beverageDecrementQuantity(){
    this.bevquantity=this.bevquantity - 1;
  }
}