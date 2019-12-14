import 'package:flutter/material.dart';

class MyAppBar extends AppBar{
  MyAppBar({Key key, Widget title}): super(key:key, title:title,  backgroundColor: Colors.black, centerTitle:true,
    actions:<Widget>[
    new FloatingActionButton(
      child: Icon(Icons.shopping_cart,color: Colors.orange[600], size: 30,),
      backgroundColor: Colors.white,
      mini: true,
      onPressed: (){},
    ),
  ]);
}