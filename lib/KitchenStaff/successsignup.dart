import 'package:flutter/material.dart';

class Success extends StatelessWidget {
 // const Success({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context,false);
            }),
        backgroundColor: Colors.brown,
        title: Text('Beverage Items'),
        centerTitle: true,
      ),
      body: message(),

    );
  }
}

Widget message(){
  return Column(
    children: <Widget>[
      Text("Your account has been succesfully created!!"),
      Image.asset('images/happy.png',fit: BoxFit.cover),
    ],
  );
}