import 'package:flutter/material.dart';
import 'imagecarousel.dart';
import 'specialItems.dart';

class Special extends StatefulWidget {
  Special({Key key}) : super(key: key);

  @override
  _SpecialState createState() => _SpecialState();
}

class _SpecialState extends State<Special> {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Column(
          children: <Widget>[
            ImageCarousel(),
            SpecialItems(),  
          ],
        ),
      ),
    );
  }
}

