import 'package:flutter/material.dart';
import 'appbar.dart';

class View extends StatefulWidget {
  View({Key key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
    int _currentIndex=0;  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar: new MyAppBar(
          leading: IconButton(
            icon:Icon(Icons.chevron_left),
            onPressed:(
              //To-DO
            ) => Navigator.pop(context,false),
          ),
          title: Text('Home'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        selectedFontSize: 17,
        unselectedFontSize: 15,
        selectedItemColor: Colors.orange[600],
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text('Home'),
          ),
           BottomNavigationBarItem(
            icon:Icon(Icons.book),
            title: Text('Menu'),
          ),
           BottomNavigationBarItem(
            icon:Icon(Icons.receipt),
            title: Text('Total Bill'),
          ),
        ],
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });
        },
      ),
      

      

      

      ),
    );
  }
}