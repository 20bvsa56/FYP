import 'package:flutter/cupertino.dart';

class FoodItem{
  int id;
  String title;
  String description;
  double price;
  String image;
  int quantity;

//creating constructor and initializing the variables.
  FoodItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.image,

    this.quantity=1
  });

  void incrementQuantity(){
    this.quantity=this.quantity + 1;
  }

  void decrementQuantity(){
    this.quantity=this.quantity - 1;
  }
}

class FooditemList{
//single member variable
List<FoodItem> foodItems;

FooditemList({
  @required this.foodItems
});
}

FooditemList fooditemList= FooditemList(foodItems: [
FoodItem(
  id: 1,
  title:'Coffee',
  description:'Water, Milk, Coffee',
  price:80.0,
  image:'images/coffee.jpeg',
),
FoodItem(
  id: 2,
  title:'Lemonade',
  description:'Water, Sugar, Lemon juice',
  price:120.0,
  image:'images/lemonade.jpeg',
),
FoodItem(
  id: 3,
  title:'Iced Tea',
  description:'Water, Loose tea, Tea bag',
  price:160.0,
  image:'images/icedtea.jpeg',
),
]);