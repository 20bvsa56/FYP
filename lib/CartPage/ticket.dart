import 'package:flutter/material.dart';
import 'dart:math';
 
class Ticket extends StatelessWidget {
 
void  generateRandomNumber() {
 
 var random = new Random();
 
    // Printing Random Number between 1 to 10000 on Terminal Window.
    print(random.nextInt(10000));
 
}
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
 
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:
              RaisedButton(
              onPressed: () => generateRandomNumber(),
              child: Text(' Click Here To Generate Random Number '),
              textColor: Colors.white,
              color: Colors.lightBlue,
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
            )
          ),
        
        ])
      )
     )
   );
  }
}