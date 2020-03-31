import 'package:flutter/material.dart';
// import 'package:menu_app/MenuCategory/categories.dart';

class RegularDetails extends StatelessWidget {
  // const RegularDetails({Key key}) : super(key: skey);
  final String name;
  final String description;
  final String price;
  final String image;

  RegularDetails(
    
    this.name,
    this.description,
    this.price,
    this.image,
    
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.black12,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(.50),
              offset: Offset(0, 0),
              blurRadius: 40,
              spreadRadius: 8,
            )
          ],
          color: Colors.white70,
        ),
        child: Column(children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Lobster-Regular',
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              isThreeLine: true,
              title: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                "Rs. " + price,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              trailing: Image.asset("system/public/foodItems/" + image),
            ),
          ),
            
                  InkWell(
                      child: RaisedButton(
                        color: Colors.brown[100],
                        elevation: 20,
                        child: const Text('Add to Cart',
                            style: TextStyle(
                                fontSize: 13, fontFamily: 'Lobster-Regular')),
                        onPressed: () {},
                      ),
                    ),
            
        ]),
      ),
    );
  }
}
