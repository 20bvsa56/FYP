import 'package:flutter/material.dart';
import 'appbar.dart';
import 'specialPage.dart';
import 'receipt.dart';
import 'menucategory.dart';

class View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _ViewState();
  }
}

class _ViewState extends State<View> {
    int _selectedPage=0;
    final _pageOption=[
      Special(),
      MenuCategory(),
      Receipt(),
    ];  
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
          title: Text('Home'),
      ),

      body: _pageOption[_selectedPage],//displays the selected page in the body 

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
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
              _selectedPage = index;
            });
        },
      ), 
     ),
    );
  }
}