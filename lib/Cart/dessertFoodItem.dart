import 'package:flutter/cupertino.dart';

DessertFoodItemList desfoodItemList= DessertFoodItemList(dessertFoodItems: [
DessertFoodItem(
  desid: 1,
  desname:'Mint Orea Cake',
  desprice: 120,
  desimage:'images/mindes.jfif',
  desdescription: 'Cake mix, Mint oreo cookies, Cake flour, Eggs',
),
DessertFoodItem(
  desid: 2,
  desname:'Chocolate Strawberry Cake',
  desprice: 150,
  desimage:'images/strawdes.jfif',
  desdescription: 'Cocoa powder, Heavy whipping cream, Egg white, Egg',
),
DessertFoodItem(
  desid: 3,
  desname:'Coconut Cream Crepe Cake',
  desprice: 150,
  desimage:'images/cocdes.jfif',
  desdescription: 'Coconut cream, Crepes, Mascarpone, Toasted coconut',
),
DessertFoodItem(
  desid: 4,
  desname:'Meyer Lemon Cake',
  desprice: 130,
  desimage:'images/lemdes.jfif',
  desdescription: 'Sour cream, Meyer lemon juice, Meyer lemon zest, Pound cake',
),
DessertFoodItem(
  desid: 5,
  desname:'Banana Pudding Parfait ',
  desprice: 120,
  desimage:'images/bandes.webp',
  desdescription: 'Heavy cream, Butter shortbread cookies, Dark rum, Egg yolk, Banana cream ',
),
]);

class DessertFoodItemList{
//single member variable
List<DessertFoodItem> dessertFoodItems;

DessertFoodItemList({
  @required this.dessertFoodItems
});
}

class DessertFoodItem{
  int desid;
  String desname;
  int desprice;
  String desimage;
  int desquantity;
  String desdescription;

//creating constructor and initializing the variables.
  DessertFoodItem({
    @required this.desid,
    @required this.desname,
    @required this.desprice,
    @required this.desimage,
    @required this.desdescription,


    this.desquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void dessertIncrementQuantity(){
    this.desquantity=this.desquantity + 1;
  }

  void dessertDecrementQuantity(){
    this.desquantity=this.desquantity - 1;
  }
}



