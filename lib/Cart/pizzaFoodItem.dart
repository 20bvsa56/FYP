import 'package:flutter/cupertino.dart';

PizzaFoodItemList pizfoodItemList= PizzaFoodItemList(pizzaFoodItems: [
PizzaFoodItem(
  pizid: 1,
  pizname:'Vegetarian',
  pizprice: 200,
  pizimage:'images/vegpiz.jpg',
  pizdescription: 'Best pizza dough, Selected fresh vegetables',
),
PizzaFoodItem(
  pizid: 2,
  pizname:'Pepperoni',
  pizprice: 320,
  pizimage:'images/peppiz.jfif',
  pizdescription: 'Best pizza dough, Pepperoni, Salami',
),
PizzaFoodItem(
  pizid: 3,
  pizname:'Diavola',
  pizprice: 300,
  pizimage:'images/diapiz.jfif',
  pizdescription: 'Best pizza dough, Fresh chili, Carpers',
),
PizzaFoodItem(
  pizid: 4,
  pizname:'Margherita',
  pizprice: 280,
  pizimage:'images/magpiz.webp',
  pizdescription: 'Best pizza dough, Fresh mozzarella cheese, Semolina',
),
PizzaFoodItem(
  pizid: 5,
  pizname:'Tropicale',
  pizprice: 250,
  pizimage:'images/tropiz.jpg',
  pizdescription: 'Pizza dough, Diced tomatoes, Ham, Pineapple',
),
PizzaFoodItem(
  pizid: 6,
  pizname:'Meatlovers',
  pizprice: 300,
  pizimage:'images/meapiz.jfif',
  pizdescription: 'Best pizza dough, Ham, Bacon, Mozzarella',
),

]);

class PizzaFoodItemList{
//single member variable
List<PizzaFoodItem> pizzaFoodItems;

PizzaFoodItemList({
  @required this.pizzaFoodItems
});
}

class PizzaFoodItem{
  int pizid;
  String pizname;
  int pizprice;
  String pizimage;
  int pizquantity;
  String pizdescription;

//creating constructor and initializing the variables.
  PizzaFoodItem({
    @required this.pizid,
    @required this.pizname,
    @required this.pizprice,
    @required this.pizimage,
     @required this.pizdescription,


    this.pizquantity=1//initializing quantity myself
  });

  //liberty to increase or decrease quantity
  void pizzaIncrementQuantity(){
    this.pizquantity=this.pizquantity + 1;
  }

  void pizzaDecrementQuantity(){
    this.pizquantity=this.pizquantity - 1;
  }
}



