import 'package:flutter/material.dart';
import 'categoryGrid.dart';

class MenuCategory extends StatefulWidget {
  MenuCategory({Key key}) : super(key: key);

  @override
  _MenuCategoryState createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Gridview(),//Call the class named Gridview from categoryGrid.dart
      ),
    );
  }
}