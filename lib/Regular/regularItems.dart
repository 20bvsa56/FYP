// class FoodItem {
//   int id;
//   int categoryId;
//   Null title;
//   Null type;
//   String name;
//   int price;
//   String description;
//   String image;
//   int quantity;
//   String tableNo;
//   int status;

//   FoodItem(
//       {this.id,
//       this.categoryId,
//       this.title,
//       this.type,
//       this.name,
//       this.price,
//       this.description,
//       this.image,
//       this.quantity,
//       this.status,
//       this.tableNo});

//   FoodItem.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     title = json['title'];
//     type = json['type'];
//     name = json['name'];
//     price = json['price'];
//     description = json['description'];
//     image = json['image'];
//     status = json['status'];
//     tableNo = json['tableNo'];
//     quantity = json['quantity'] = 1;
//   }

// //returns JSON object that has key/value pairs
//   Map<String, dynamic> toJson(jsonData) {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['title'] = this.title;
//     data['type'] = this.type;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['quantity'] = this.quantity;
//     data['tableNo'] = this.tableNo;
//     data['status'] = this.status;
//     return data;
//   }

//   //liberty for customer to increase or decrease quantity
//   void incrementQuantity() {
//     this.quantity = this.quantity + 1;
//   }

//   void decrementQuantity() {
//     this.quantity = this.quantity - 1;
//   }
// }

import 'dart:convert';

// class FoodItems{
//   List<FoodItem> foodItems;

//   FoodItems({this.foodItems});

//   factory FoodItems.fromJson(List<dynamic> parsedJson){

//     List<FoodItem> foodItems = List<FoodItem>();
//     foodItems = parsedJson.map((i)=>FoodItem.fromJson(i)).toList();

//     return FoodItems(
//       foodItems: foodItems,
//     );
//   }

//   factory FoodItems.toJson(List<FoodItem> foodItems){
    
//     List<FoodItem> foodItems = List<FoodItem>();
//     //var json = jsonEncode(foodItems, toEncodable: (e) => e.toJson());

//   //converting each item of list into JSON object individually
//    var json = jsonEncode(foodItems.map((e) => e.toJson()).toList());
//     print(json);
//    // foodItems = parsedJson.map((i)=>FoodItem.toJson(i)).toList();
//     //var foodItems = jsonEncode(foodItems.map((e) => e.toJson()).toList());
    
//    return FoodItems(foodItems: foodItems);
//   }
// }

class FoodItem {
  int id;
  int categoryId;
  Null title;
  Null type;
  String Name;
  int price;
  String description;
  String image;
  int Quantity;
  int status;
  String tableNo;
  List cart;

  FoodItem({this.id,
      this.categoryId,
      this.title,
      this.type,
      this.Name,
      this.price,
      this.description,
      this.image,
      this.Quantity,
      this.status,
      this.tableNo,
      this.cart});

//parses json object into fooditem object.
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
        id: json['id'],
        Name: json['name'],
        type: json['type'],
        categoryId: json['category_id'],
        price: json['price'],
        description: json['description'],
        image: json['image'],
        title: json['title'],
        Quantity: json['quantity'] = 1,
        tableNo: json['tableNo'],
        status: json['status'] = 0,
        cart: json['cart']
        );
  }
  //returns JSON object that has key/value pairs
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['image'] = this.image;
  //   data['quantity'] = this.quantity;
  //   return data;
  // }

  // factory FoodItem.toJson(List<FoodItem> foodItems){
    
  //   List<FoodItem> foodItems = List<FoodItem>();
  //   //var json = jsonEncode(foodItems, toEncodable: (e) => e.toJson());

  // //converting each item of list into JSON object individually
  //  var json = jsonEncode(foodItems.map((e) => e.toJson()).toList());
  //   print(json);
  //  // foodItems = parsedJson.map((i)=>FoodItem.toJson(i)).toList();
  //   //var foodItems = jsonEncode(foodItems.map((e) => e.toJson()).toList());
    
  //  return FoodItem();
  // }

Map<String,dynamic> toJson(){
    return {
      "Name": this.Name,
      // "Image": this.image,
      "Quantity": this.Quantity
    };
  }

 static List encondeToJson(List<FoodItem> foodItems){
    List jsonList = List();
    foodItems.map((item)=>
      jsonList.add(item.toJson())
    ).toList();
    return jsonList;
}

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = Name;
    map["type"] = type;
    map["category_id"] = categoryId;
    map["price"] = price;
    map["description"]=description;
    map["image"]=image;
    map["id"]=id;
    map["title"]=title;
    map["quantity"]=Quantity;
    map["tableNo"]=tableNo;
    map["status"]=status;
    map["cart"]=cart;
    return map;
  }

    void incrementQuantity() {
    this.Quantity = this.Quantity + 1;
  }

  void decrementQuantity() {
    this.Quantity = this.Quantity - 1;
  }
}
