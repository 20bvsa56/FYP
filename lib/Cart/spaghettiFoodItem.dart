import 'package:flutter/cupertino.dart';

SpaghettiFoodItemList spafoodItemList= SpaghettiFoodItemList(spaghettiFoodItems: [
SpaghettiFoodItem(
  spaid: 1,
  spaname:'Garlicky Spaghetti',
  spaprice: 200,
  spaimage:'images/garspa.jpg',
  spadescription: 'Panko  bread crumbs, Lemon, Red pepper flakes, Butter, Olive',
),
SpaghettiFoodItem(
  spaid: 2,
  spaname:'Vegetarian Spaghetti',
  spaprice: 200,
  spaimage:'images/vegspa.jfif',
  spadescription: 'Meatless spaghetti sauce, Garbanzo beans, Parmesan',
),
SpaghettiFoodItem(
  spaid: 3,
  spaname:'Baked Spaghetti',
  spaprice: 150,
  spaimage:'images/bakedspa.jfif',
  spadescription: 'Curd cottage cheese, Ground beef, Meatless spaghetti sauce, Eggs',
),
SpaghettiFoodItem(
  spaid: 4,
  spaname:'Lentil Bolgnese',
  spaprice: 250,
  spaimage:'images/lenspa.jfif',
  spadescription: 'Red lentils, Spaghetti, Cheese, Tomato, Carrots',
),
SpaghettiFoodItem(
  spaid: 5,
  spaname:'Spaghetti Salad',
  spaprice: 120,
  spaimage:'images/spasal.jfif',
  spadescription: 'Red wine vinegar, Spaghetti, Feta cheese, Green bell pepper, Cherry tomatoes',
),
SpaghettiFoodItem(
  spaid: 6,
  spaname:'Chicken Spaghetti',
  spaprice: 220,
  spaimage:'images/chispa.jfif',
  spadescription: 'Mushroom soup, Green bell pepper, Red bell pepper, Chicken broth, Cream cheese',
),

]);

class SpaghettiFoodItemList{
//single member variable
List<SpaghettiFoodItem> spaghettiFoodItems;

SpaghettiFoodItemList({
  @required this.spaghettiFoodItems
});
}

class SpaghettiFoodItem{
  int spaid;
  String spaname;
  int spaprice;
  String spaimage;
  int spaquantity;
  String spadescription;

//creating constructor and initializing the variables.
  SpaghettiFoodItem({
    @required this.spaid,
    @required this.spaname,
    @required this.spaprice,
    @required this.spaimage,
     @required this.spadescription,


    this.spaquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void spaghettiIncrementQuantity(){
    this.spaquantity=this.spaquantity + 1;
  }

  void spaghettiDecrementQuantity(){
    this.spaquantity=this.spaquantity - 1;
  }
}



