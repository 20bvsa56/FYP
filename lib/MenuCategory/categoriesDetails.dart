import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItemUI.dart';

class CategoriesDetails extends StatelessWidget {
  // const CategoriesDetails({Key key}) : super(key: key);
  final int id;
  final String name;
  final String image;

  CategoriesDetails(
    this.id,
    this.name,
    this.image,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var route= new MaterialPageRoute(
          builder: (BuildContext context) => new RegularCategory(),
        );
       Navigator.of(context).push(route);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(children: <Widget>[
          
          Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.brown[200],
            ),
            // child:Image.asset(image,fit: BoxFit.fill),
            child: Image.asset("system/public/foodItems/" + image),
          ),
          
          Positioned(
            left: 30.0,
            top: 110.0,
            child: Material(
              color: Colors.brown[50],
              elevation: 8.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Color(0x802196F3),
              child: Container(
                child: Column(
                  children: <Widget>[
                    // SizedBox(height: 10.0),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        child: Center(
                            child: Text(name,
                                style: TextStyle(
                                    fontFamily: 'Rancho-Regular',
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ),
                    )
                   
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
