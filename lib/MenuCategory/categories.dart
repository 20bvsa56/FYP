class Categories {
  
  final int id;
  final String name;
  final String image;

  Categories({this.id,this.name, this.image});

  factory Categories.fromJson(Map<String, dynamic> json){
    return Categories(
      id: json['id'],
      name: json['name'],
      image: json['image']
    );
  }
}
