import 'package:flutter/material.dart';
import 'package:menu_app/CartPage/foodcart.dart';
import 'package:menu_app/MenuCategory/menuCategoryUI.dart';
import 'package:menu_app/Specials/specialCategoryUI.dart';

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final List<Widget> pages = [
    SpecialCategory(
      key: PageStorageKey('Page1'),
    ),
    MenuCategory(
      key: PageStorageKey('Page2'),
    ),
    FoodCart(
      key: PageStorageKey('Page3'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        selectedFontSize: 17,
        unselectedFontSize: 15,
        selectedItemColor: Colors.orange[600],
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('Menu')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Food Cart')),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
