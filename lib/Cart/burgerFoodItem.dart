import 'package:flutter/cupertino.dart';

BurgerFoodItemList burfoodItemList= BurgerFoodItemList(burgerFoodItems: [
BurgerFoodItem(
  burid: 1,
  burname:'Classic Burger',
  burprice: 250,
  burimage:'images/clabur.jfif',
  burdescription: 'Bread crumbs, Iceberg lettuce, Red onion, Egg, Garlic',
),
BurgerFoodItem(
  burid: 2,
  burname:'BBQ Burger',
  burprice: 200,
  burimage:'images/bbqbur.jfif',
  burdescription: 'Ground beef, Barbecue sauce, Eggs, Garlic',
),
BurgerFoodItem(
  burid: 3,
  burname:'Chili Cheese Burger',
  burprice: 230,
  burimage:'images/chilibur.jpeg',
  burdescription: 'Ground beef, Brown sugar, Cheddar cheese, Tomato paste, Chilli powder',
),
BurgerFoodItem(
  burid: 4,
  burname:'Veggie Burger',
  burprice: 150,
  burimage:'images/vegbur.jfif',
  burdescription: 'Black beans, Oat bran, Tomato paste, Vegetables, Garlic',
),
BurgerFoodItem(
  burid: 5,
  burname:'Mushroom Burger',
  burprice: 230,
  burimage:'images/musbur.jfif',
  burdescription: 'Mushroom cap, Whole wheat, Montreal steak, Eggs',
),
]);

class BurgerFoodItemList{
//single member variable
List<BurgerFoodItem> burgerFoodItems;

BurgerFoodItemList({
  @required this.burgerFoodItems
});
}

class BurgerFoodItem{
  int burid;
  String burname;
  int burprice;
  String burimage;
  int burquantity;
  String burdescription;

//creating constructor and initializing the variables.
  BurgerFoodItem({
    @required this.burid,
    @required this.burname,
    @required this.burprice,
    @required this.burimage,
     @required this.burdescription,


    this.burquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void burgerIncrementQuantity(){
    this.burquantity=this.burquantity + 1;
  }

  void burgerDecrementQuantity(){
    this.burquantity=this.burquantity - 1;
  }
}



