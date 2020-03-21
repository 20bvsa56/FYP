import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  // const ItemsDetails({Key key}) : super(key: key);

  final String title;
  final String name;
  final String price;
  final String image;

  ItemsDetails(
    this.title,
    this.name,
    this.price,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 40, 10),
      child: Stack(children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: Colors.black,
            //  image: Image.asset( 'system/public/foodItems/' + image),
          ),
          // child:Image.asset(image,fit: BoxFit.fill),
        ),
        Positioned(
          left: 20.0,
          top: 120.0,
          child: Material(
            color: Colors.brown[50],
            elevation: 8.0,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      child: Center(
                          child: Text(title,
                              style: TextStyle(
                                fontFamily: 'Lobster-Regular',
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Center(
                        child: Text(name,
                            style: TextStyle(
                              fontFamily: 'Rancho-Regular',
                                color: Colors.brown,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold))),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(" Rs." + price,
                          style:
                              TextStyle(color: Colors.brown, 
                              fontFamily: 'Rancho-Regular',
                              fontSize: 16.0)),
                    ],
                  )),
                  Center(
                    child: InkWell(
                      child: RaisedButton(
                        color: Colors.brown[100],
                        elevation: 20,
                        child: const Text('Add to Cart',
                            style: TextStyle(fontSize: 12,
                            fontFamily: 'Lobster-Regular')),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
