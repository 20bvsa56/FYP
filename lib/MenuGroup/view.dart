import 'package:flutter/material.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
import 'package:menu_app/Specials/specialCategoryUI.dart';
import 'package:menu_app/cart/cart.dart';
// import 'package:menu_app/Cart/cart.dart';
// // import 'appbar.dart';
// import 'package:menu_app/Specials/specialCategoryUI.dart';
// import 'menuCategory.dart';

class View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewState();
  }
}

class _ViewState extends State<View> {
  final Key keyOne= PageStorageKey('specialPage');
  final Key keyTwo= PageStorageKey('menuPage');
  final Key keyThree= PageStorageKey('cartPage');
  
  int currentTab = 0;

  SpecialCategory one;
  MenuCategory two;
  Cart three;
  List<Widget> pages;
  Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState(){
    one = SpecialCategory(
      key: keyOne,
    );
    two = MenuCategory(
      key: keyTwo,
    );
    three= Cart(
      key: keyThree,
    );

    pages=[one, two, three];
    currentPage=one;
    super.initState();

  }
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: PageStorage (
        child:currentPage,
        bucket: bucket),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[300],
          selectedFontSize: 17,
          unselectedFontSize: 15,
          selectedItemColor: Colors.orange[600],
          currentIndex: currentTab,
          onTap: (int index){
            setState(() {
              currentTab= index;
              currentPage= pages[index];
            }); 
          },
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
        ),
      ),
    );
  }
}