import 'package:flutter/cupertino.dart';

DinnerFoodItemList dinfoodItemList= DinnerFoodItemList(dinnerFoodItems: [
DinnerFoodItem(
  dinid: 1,
  dinname:'Veg Khana Set',
  dinprice: 130,
  dinimage:'images/veg.jpg',
  dindescription: 'Rice, Pickle, Curry, Ghee, Salad, Curd',
),
DinnerFoodItem(
  dinid: 2,
  dinname:'Fish Khana Set',
  dinprice: 210,
  dinimage:'images/fish.jpg',
  dindescription: 'Rice, Fish, Pickle, Curry, Ghee, Salad, Curd',
),
DinnerFoodItem(
  dinid: 3,
  dinname:'Chicken Khana Set',
  dinprice: 280,
  dinimage:'images/chicken.jfif',
  dindescription: 'Rice, Chicken, Pickle, Curry, Ghee, Salad, Curd',
),
DinnerFoodItem(
  dinid: 4,
  dinname:'Mutton Khana Set',
  dinprice: 450,
  dinimage:'images/mutton.jfif',
  dindescription: 'Rice, Mutton, Pickle, Curry, Ghee, Salad, Curd',
),
]);

class DinnerFoodItemList{
//single member variable
List<DinnerFoodItem> dinnerFoodItems;

DinnerFoodItemList({
  @required this.dinnerFoodItems
});
}

class DinnerFoodItem{
  int dinid;
  String dinname;
  int dinprice;
  String dinimage;
  int dinquantity;
  String dindescription;

//creating constructor and initializing the variables.
  DinnerFoodItem({
    @required this.dinid,
    @required this.dinname,
    @required this.dinprice,
    @required this.dinimage,
     @required this.dindescription,


    this.dinquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void dinnerIncrementQuantity(){
    this.dinquantity=this.dinquantity + 1;
  }

  void dinnerDecrementQuantity(){
    this.dinquantity=this.dinquantity - 1;
  }
}



