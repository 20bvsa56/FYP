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

//    void orderDelivered(){
//     this.status = this.status + 1;
//   }
// }

class OrderModel {
  int id;
  String tableNo;
  String item;
  String quantity;
  int status;

  OrderModel({this.id, this.tableNo, this.item, this.quantity, this.status});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(id: json['id'], tableNo: json['tableNo'],item: json['item'],quantity: json['quantity'],status: json['status']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["tableNo"] = tableNo;
    map["item"] = item;
    map["quantity"] = quantity;
    map["status"] = status=0;

    return map;
  }
}