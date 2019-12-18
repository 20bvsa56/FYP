import 'package:flutter/material.dart';

class SpecialItems extends StatefulWidget {
  SpecialItems({Key key}) : super(key: key);

  @override
  _SpecialItemsState createState() => _SpecialItemsState();
  
}

class _SpecialItemsState extends State<SpecialItems> {  

  @override
  Widget build(BuildContext context) {
    return Container(
       height:300,
       child: ListView(
         scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 105, vertical: 15),
              width: 200.0,
               child: Card(
                 child: Wrap(
                   children: <Widget>[ 
                     Center(child:Text('Todays Special',
                     style:TextStyle(
                          fontFamily: 'Lobster-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,     
                       ),
                      ),
                     ),
                     Image.asset('images/bacon_cheese.jpg'),
                     ListTile(
                       //  onTap: (),
                       title: Text('Bacon Double Cheeseburger Grilled Cheese Sandwich',
                       style: TextStyle(
                          fontFamily: 'Rancho-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                       ),
                       ),
                       subtitle: Text('Rs.450',
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
            ),

            
          ],
       ),
    );
  }
}