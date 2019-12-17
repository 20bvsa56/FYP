import 'package:flutter/material.dart';

class Receipt extends StatefulWidget {
  Receipt({Key key}) : super(key: key);

  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
      ),
      ),
    );
  }
}