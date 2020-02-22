import 'package:flutter/material.dart';

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

          Container(
            margin: EdgeInsets.all(10),
            child: new Card(
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/beverage.jpeg',
                  height: 100,
                  width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text('BEVERAGE',
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

          Container(
            margin: EdgeInsets.all(10),
            child: new Card(
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/breakfastmenu.jpeg',
                  height: 100,
                  width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text('BREAKFAST',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-Regular',
                        fontSize: 20.0,
                      ),),
                    ),                    
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: new Card(
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/lunch.jpeg',
                  height: 100,
                  width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text('LUNCH',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-Regular',
                        fontSize: 20.0,
                      ),),
                    ),                    
                  ),
                ],
              ),
            ),
          ),


          Container(
            margin: EdgeInsets.all(10),
            child: new Card(
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/dinner.jpeg',
                  height: 100,
                  width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text('DINNER',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-Regular',
                        fontSize: 20.0,
                      ),),
                    ),                    
                  ),
                ],
              ),
            ),
          ),


          Container(
            margin: EdgeInsets.all(10),
            child: new Card(
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('images/spaghetti.jpg',
                  height: 100,
                  width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text('SPAGHETTI',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-Regular',
                        fontSize: 20.0,
                      ),)
                      ,
                    ),                    
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
      );
  }
}