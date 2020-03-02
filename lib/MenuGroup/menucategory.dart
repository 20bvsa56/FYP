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
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Menu Category'),
          centerTitle: true,
        ),
          body:
              Gridview(), //Call the class named Gridview from categoryGrid.dart
        ),
      ),
    );
  }
}
