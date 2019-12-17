import 'package:flutter/material.dart';

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
      body:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
      ),
      ),
    );
  }
}