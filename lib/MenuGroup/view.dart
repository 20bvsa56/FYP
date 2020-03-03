import 'package:flutter/material.dart';
import 'package:menu_app/Cart/cart.dart';
// import 'appbar.dart';
import 'package:menu_app/Specials/specialCategoryUI.dart';
import 'menuCategory.dart';

class View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewState();
  }
}

class _ViewState extends State<View> {
  int _selectedPage = 0;
  final _pageOption = [
    SpecialCategory(),
    MenuCategory(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       

        body:
            _pageOption[_selectedPage], //displays the selected page in the body

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[300],
          selectedFontSize: 17,
          unselectedFontSize: 15,
          selectedItemColor: Colors.orange[600],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Menu'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Food Cart'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}