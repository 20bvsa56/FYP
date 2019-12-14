import 'package:flutter/material.dart';
import 'appbar.dart';

class View extends StatefulWidget {
  View({Key key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar: new MyAppBar(
          title: Text('Home'),
      ),
      

      ),
    );
  }
}