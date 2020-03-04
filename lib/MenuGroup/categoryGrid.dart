import 'package:flutter/material.dart';
import 'package:menu_app/Regular/beverageItemUI.dart';
import 'package:menu_app/Regular/breakfastItemUI.dart';

class Gridview extends StatefulWidget {
  Gridview({Key key}) : super(key: key);

  @override
  _GridviewState createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BeverageItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/beverage.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'BEVERAGE',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/breakfastmenu.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'BREAKFAST',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/lunch.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'LUNCH',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/dinner.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'DINNER',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/pizza2.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'PIZZA',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/burger2.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'BURGER',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/dessert.jpeg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'DESSERT',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BreakfastItem()));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: new Card(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/spaghetti2.jpg',
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'SPAGHETTI',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lobster-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
