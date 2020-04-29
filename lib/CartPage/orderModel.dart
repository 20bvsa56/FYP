// class OrderModel {
//   int id;
//   String tableNo;
//   String item;
//   int quantity;
//   int status;

//   OrderModel({this.id, this.tableNo, this.item, this.quantity, this.status});

//   OrderModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tableNo = json['tableNo'];
//     item = json['item'];
//     quantity = json['quantity'];
//     status = json['status']=0;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['tableNo'] = this.tableNo;
//     data['item'] = this.item;
//     data['quantity'] = this.quantity;
//     data['status'] = this.status;
//     return data;
//   }

//   //  void orderDelivered(){
//   //   this.status = this.status + 1;
//   // }
// }

// class OrderModel {
//   int id;
//   String tableNo;
//   String item;
//   String quantity;
//   int status;

//   OrderModel({this.id, this.tableNo, this.item, this.quantity, this.status});

// //parses json object into order model object.
//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     return OrderModel(id: json['id'], tableNo: json['tableNo'],item: json['item'],quantity: json['quantity'],status: json['status']);
//   }

//   Map toMap() {
//     var map = new Map<String, dynamic>();
//     map["id"] = id;
//     map["tableNo"] = tableNo;
//     map["item"] = item;
//     map["quantity"] = quantity;
//     map["status"] = status=0;

//     return map;
//   }
// }

class OrderModel {
  int id;
  String tableNo;
  int status;
  List<Orders> orders;

  OrderModel({this.id, this.tableNo, this.status, this.orders});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tableNo = json['tableNo'];
    status = json['status'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tableNo'] = this.tableNo;
    data['status'] = this.status;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String name;
  int quantity;

  Orders({this.name, this.quantity});

  Orders.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}


// order() {
//   List<Orders> orders = [];
//   String jsonTags = jsonEncode(orders);
//   print(jsonTags);

// }