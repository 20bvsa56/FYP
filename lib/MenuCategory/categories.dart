class Categories {
  int id;
  String name;
  String image;

  Categories({this.id, this.name, this.image});

//parses json object into category object.
  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}



