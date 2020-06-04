import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget leading})
      : super(
            key: key,
            title: title,
            leading: leading,
            backgroundColor: Colors.black,
            centerTitle: true,
            actions: <Widget>[    
            ]);
}
