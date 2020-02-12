import 'package:flutter/material.dart';
import 'categoryGrid.dart';

class SpecialFood extends StatefulWidget {
  SpecialFood({Key key}) : super(key: key);

  @override
  _SpecialFoodState createState() => _SpecialFoodState();
}

class _SpecialFoodState extends State<SpecialFood> {
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