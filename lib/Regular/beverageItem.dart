import 'package:flutter/material.dart';

class BeverageItem extends StatefulWidget {
  BeverageItem({Key key}) : super(key: key);

  @override
  _BeverageItemState createState() => _BeverageItemState();
}

class _BeverageItemState extends State<BeverageItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Beverage Items'),
          centerTitle: true,
        ),
    );
  }
}
