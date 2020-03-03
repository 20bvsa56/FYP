import 'package:flutter/material.dart';

class BreakfastItem extends StatefulWidget {
  BreakfastItem({Key key}) : super(key: key);

  @override
  _BreakfastItemState createState() => _BreakfastItemState();
}

class _BreakfastItemState extends State<BreakfastItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('Breakfast Items'),
          centerTitle: true,
        ),
    );
  }
}
