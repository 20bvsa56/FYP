class Items {
  Null id;
  Null categoryId;
  String title;
  Null type;
  String name;
  int price;
  Null description;
  String image;
  int quantity;

  Items(
      {this.id,
      this.categoryId,
      this.title,
      this.type,
      this.name,
      this.price,
      this.description,
      this.image,
      this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    type = json['type'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    quantity = json['quantity']=1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    return data;
  }
}