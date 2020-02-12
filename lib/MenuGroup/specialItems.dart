
import 'package:flutter/material.dart';
import 'package:menu_app/MenuGroup/specialFood.dart';

class SpecialItems extends StatefulWidget {
  SpecialItems({Key key}) : super(key: key);

  @override
  _SpecialItemsState createState() => _SpecialItemsState();
  
}

class _SpecialItemsState extends State<SpecialItems> {  

  Container specialLists(String title, String foodImage, String foodName, String foodPrice){
    return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              width: 200.0,
               child: Card(
                 child: Wrap(
                   children: <Widget>[ 
                     Center(child:Text(title,
                     style:TextStyle(
                          fontFamily: 'Lobster-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,     
                       ),
                      ),
                     ),
                     
                     Image.asset(foodImage, fit: BoxFit.cover),

                     ListTile(
                       title: Text(foodName,
                       style: TextStyle(
                          fontFamily: 'Rancho-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                       ),
                       ),
                       subtitle: Text(foodPrice,
                       style:TextStyle(
                          fontFamily: 'Rancho-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,     
                       ),
                       ),
                      
                     ),
                   ],
                 ),
               )
            );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       height:300,
       child: ListView(
         scrollDirection: Axis.horizontal,
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.view_list),
              onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpecialFood()),
            );
              },
            ),
            specialLists('Beverage Special','images/ValenciaFizz.jpg','Valencia Fizz','Rs.200'),
            specialLists('Breakfast Special','images/pancake.jpg','Blueberry Pancake','Rs.220'),
            specialLists('Lunch Special','images/bacon_cheese.jpg','Bacon Double Cheeseburger Grilled Cheese Sandwich','Rs.320'),
            specialLists('Dinner Special','images/thakali.jpg','Nepali Thakali Khana Set','Rs.400'),
            new IconButton(
              icon: new Icon(Icons.view_list),
              onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpecialFood()),
            );
              },
            ),
          ],
       ), 
    );

  }
}

