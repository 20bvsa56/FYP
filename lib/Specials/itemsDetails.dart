import 'package:flutter/material.dart';
import 'items.dart';


class ItemsDetails extends StatelessWidget {
  // const ItemsDetails({Key key}) : super(key: key);
  final Items item;

  ItemsDetails({this.item, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BlocProvider takes list of blocs which returns SpecialCartListBloc.
    return InkWell(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 40, 10),
        child: Stack(children: <Widget>[
          Container(
            width: 170.0,
            height: 210.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.brown[200],
            ),

            // child:Image.asset(image,fit: BoxFit.fill),
            child: Image.asset('system/public/foodItems/' + item.image),
          ),
          Positioned(
            left: 10.0,
            top: 170.0,
            child: Material(
              color: Colors.brown[50],
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Color(0x802196F3),
              child: Container(
                child: Column(
                  children: <Widget>[
                   
                    SizedBox(height: 10.0),
                    Container(
                      child: Center(
                          child: Text(item.name,
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
                        Text(" Rs." + item.price.toString(),
                            style: TextStyle(
                                color: Colors.brown,
                                fontFamily: 'Rancho-Regular',
                                fontSize: 16.0)),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    
    );
  }
}
