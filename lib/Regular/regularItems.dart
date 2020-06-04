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
  int totalAmount;

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
      this.cart,
      this.totalAmount});

//parses json object into fooditem object.

 Map<String, dynamic> toJson() {
    return {
     'Name':Name,
     'Quantity':Quantity
    };
  }

// Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['Name'] = this.Name;
//     data['Quantity'] = this.Quantity;
//     data['totalAmount'] = this.totalAmount;
//     data['cart'] = this.cart;
//     return data;
//   }

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
        status: json['status'],
        totalAmount: json['totalAmount'],
        cart: json['cart']
        );
  }

// This method convert the list of fooditem into an Json Array
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
    map["totalAmount"]=totalAmount;
    return map;
  }

    void incrementQuantity() {
    this.Quantity = this.Quantity + 1;
  }

  void decrementQuantity() {
    this.Quantity = this.Quantity - 1;
  }
}

