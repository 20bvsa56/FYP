import 'package:flutter/material.dart';
import 'KitchenStaff/successsignup.dart';
import 'home.dart';
import 'KitchenStaff/login.dart';
import 'MenuGroup/view.dart';
import 'KitchenStaff/signup.dart';
// import 'Specials/specialPage.dart';


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
      //When navigating to the "/register" route, build the SignUp widget.
      '/signup': (context) => SignUp(),
       //When navigating to the "/specials" route, build the Special widget.
      // '/specials': (context) => Special(),
      '/success':(context) => Success(),
     
    },
    );
  }
}

