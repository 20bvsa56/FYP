import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  // const ItemsDetails({Key key}) : super(key: key);

  final String title;
  final String name;
  final String image;
  final String price;

  ItemsDetails(
    this.title,
    this.name,
    this.image,
    this.price,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      children: <Widget>[
      Container(
        width: 250.0,
        height: 270.0,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
           // image: new AssetImage(system/public/foodItems/image),        
        ),
        child:Image.asset(image),
      ),
      Positioned(
        left: 140.0,
        top: 70.0,
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              width: 230.0,
              height: 150.0,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      child: Center(
                          child: Text(title,
                              style: TextStyle(
                                  color: Color(0xff07128a),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Center(
                        child: Text(name,
                            style: TextStyle(
                                color: Color(0xff2da9ef),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text( " Rs." + price,
                          style: TextStyle(
                              color: Color(0xffff6f00), fontSize: 16.0)),
                    ],
                  )),
                ],
              ),
            )),
      ),
    ]),
  );
  }
}