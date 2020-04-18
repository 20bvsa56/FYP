import 'package:flutter/material.dart';
import 'order.dart';

class StaffHome extends StatelessWidget {
  const StaffHome({Key key, this.username}) : super(key: key);

  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              title: Text('Home'),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/drawer.jpg'))),
                    child: Stack(children: <Widget>[
                      Positioned(
                          bottom: 0.0,
                          left: 90.0,
                          child: Text("Tastyorama",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Pacifico-Regular',
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ))),
                    ]),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.fastfood,
                      color: Colors.brown[300],
                    ),
                    title: Text('Food Order',
                        style: TextStyle(fontSize: 18, color: Colors.brown)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Order()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.brown[300],
                    ),
                    title: Text('Logout',
                        style: TextStyle(fontSize: 18, color: Colors.brown)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/kitchencg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  height: 80,
                  bottom: 8.0,
                  left: 70.0,
                  right: 50.0,
                  child: Container(
                    color: Colors.brown[200],
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          Text("Welcome " + username, style: TextStyle(fontSize: 19,fontFamily: 'Lobster-Regular',),),
                          InkWell(
                              child: RaisedButton(
                            color: Colors.brown[500],
                            onPressed: () {
                              // Navigate to the main login screen using a named route '/login'.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Order()));
                            },
                            child: Text('View Order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Rancho-Regular',
                                )),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white70),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
