import 'package:flutter/material.dart';

class MyAppBar extends AppBar{
  MyAppBar({Key key, Widget title, Widget leading}): super(key:key, title:title,  leading:leading, backgroundColor: Colors.black, centerTitle:true, 
    actions:<Widget>[
      
      GestureDetector(
        onTap: (){
          // if(length>0){
          //   Navigator
          // }
        },
          child: Container(
          margin: EdgeInsets.only(right:10),
          child: Text('0',
          style: TextStyle(
            color:Colors.black,
            fontSize: 20,
          ) ),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
  ]);
}

      // new FloatingActionButton(
      //   child: Icon(Icons.shopping_cart,color: Colors.orange[600], size: 30,),
      //   backgroundColor: Colors.white,
      //   mini: true,
      //   onPressed: (){},
      // ),