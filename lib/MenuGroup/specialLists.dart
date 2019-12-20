import 'package:flutter/material.dart';
import 'appbar.dart';

class SpecialItemsLists extends StatefulWidget {
  SpecialItemsLists({Key key}) : super(key: key);

  @override
  _SpecialItemsListsState createState() => _SpecialItemsListsState();
}

class _SpecialItemsListsState extends State<SpecialItemsLists> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      appBar: new MyAppBar(
          leading: IconButton(
            icon:Icon(Icons.chevron_left),
            onPressed:(
              //To-DO
            ) => Navigator.pop(context,false),
          ),
          title: Text('Todays Special'),
      ),
      ),
    );
  }
}