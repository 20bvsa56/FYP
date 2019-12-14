import 'package:flutter/material.dart';
import 'home.dart';
import 'KitchenStaff/Login.dart';
import 'MenuGroup/view.dart';
import 'KitchenStaff/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // Starting the app with the "/" named route.
       initialRoute: '/',
       routes: {
      // When navigating to the "/" route, build the Home widget.
      '/': (context) => Home(),
      // When navigating to the "/login" route, build the Login widget.
      '/login': (context) => Login(),
      //When navigating to the "/login" route, build the View widget.
      '/view': (context) => View(),
      //When navigating to the "/login" route, build the View widget.
      '/register': (context) => Register(),
    },
    );
  }
}

