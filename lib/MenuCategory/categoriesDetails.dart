import 'package:flutter/material.dart';

class CategoriesDetails extends StatelessWidget {
  // const CategoriesDetails({Key key}) : super(key: key);

  final String name;
  final String image;

  CategoriesDetails(
    this.name,
    this.image,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Container(
              width: 180.0,
              height: 150.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.brown[200],
              ),            
            child:ListTile(
                 // child: Image.asset("system/public/foodItems/" + image, fit: BoxFit.fill),
              title: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              trailing:
                  IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
            ),
            
            ),
            // Image.asset("system/public/foodItems/" + image)
        //       Container(
        //   width: 180.0,
        //   height: 180.0,
        //   decoration: new BoxDecoration(
        //     borderRadius: BorderRadius.circular(24.0),
        //     color: Colors.brown[200],
        //   ),
        //   // child:Image.asset(image,fit: BoxFit.fill),
        //   // child: Image.asset("system/public/foodItems/" + image),
        // ),
            // ),
          ],
        ),
      ),
    );
  }
}
