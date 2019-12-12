import 'package:flutter/material.dart';

class View extends StatefulWidget {
  View({Key key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // action button
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.shopping_cart, color: Colors.orange[600], size: 30,),
              backgroundColor: Colors.white,
              mini: true,
            ),
           ],
          backgroundColor: Colors.black,
          title: Text('Home'),
          centerTitle: true,
      ),
          // bottomNavigationBar: FlipBoxBar(
          //     selectedIndex: index,
          //     items: [
          //       FlipBarItem(icon: Icon(Icons.map), text: Text("Map"), frontColor: Colors.blue, backColor: Colors.blueAccent),
          //       FlipBarItem(icon: Icon(Icons.add), text: Text("Add"), frontColor: Colors.cyan, backColor: Colors.cyanAccent),
          //       FlipBarItem(icon: Icon(Icons.chrome_reader_mode), text: Text("Read"), frontColor: Colors.orange, backColor: Colors.orangeAccent),
          //       FlipBarItem(icon: Icon(Icons.print), text: Text("Print"), frontColor: Colors.purple, backColor: Colors.purpleAccent),
          //       FlipBarItem(icon: Icon(Icons.print), text: Text("Print"), frontColor: Colors.pink, backColor: Colors.pinkAccent),
          //     ],
          //     onIndexChanged: (newIndex) {
          //       setState() {
          //           selectedIndex = newIndex;
          //       }
          //     },
          //   ),

      ),
    );
  }
}