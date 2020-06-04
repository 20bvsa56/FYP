class Items {
  Null id;
  int categoryId;
  String title;
  Null type;
  String name;
  int price;
  String description;
  String image;

  Items(
      {this.id,
      this.categoryId,
      this.title,
      this.type,
      this.name,
      this.price,
      this.description,
      this.image,
      });

//parses json object into items object.
  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    type = json['type'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
  }

}