import 'package:flutter/material.dart';
// import 'imagebanner.dart';

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
      home: Scaffold(
        body:Container(
          child:Banner(
            child:Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/banner.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            height: 210.0,
            width: 900.0,
            ), 
             message:'WELCOME',
             textDirection: TextDirection.ltr,
             location: BannerLocation.topEnd,
          ),
        ),
      ),
    );
  }
}