import 'package:flutter/material.dart';

class MyAppBar extends AppBar{
  MyAppBar({Key key, Widget title, Widget leading}): super(key:key, title:title,  leading:leading, backgroundColor: Colors.black, centerTitle:true, 
    actions:<Widget>[
      new FloatingActionButton(
        child: Icon(Icons.shopping_cart,color: Colors.orange[600], size: 30,),
        backgroundColor: Colors.white,
        mini: true,
        onPressed: (){},
      ),
  ]);
}