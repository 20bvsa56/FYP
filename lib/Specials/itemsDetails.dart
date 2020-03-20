import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  // const ItemsDetails({Key key}) : super(key: key);

  final String title;
  final String name;
  final String image;
  final int price;

  ItemsDetails(
    this.title,
    this.name,
    this.image,
    this.price,
  );

  @override
  Widget build(BuildContext context) {
     return new Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(5),
    child: Card(
      color: Colors.brown[50],
      child: Wrap(
        children: <Widget>[
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Lobster-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Image.asset(image, fit: BoxFit.cover),
          ListTile(
            isThreeLine: false,
            title: Text(
              name,
              style: TextStyle(
                fontFamily: 'Rancho-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            subtitle: Text(
              "Rs. " + price.toString(),
              style: TextStyle(
                fontFamily: 'Rancho-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}