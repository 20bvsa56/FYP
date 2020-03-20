import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SpecialCategory extends StatefulWidget {
  SpecialCategory({Key key}) : super(key: key);

  @override
  _SpecialCategoryState createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  
  Future<List<Items>> _specialItems async(){
    var data = http.get("http://192.168.254.1:8000/api/view_items");
    var jsonData = json.decode(data);


  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
    );
  }
}

class Items{
  final String title;
  final String name;
  final int price;
  final String image;

  Items(
    this.title,
    this.name,
    this.price,
    this.image
  );
}