import 'package:flutter/material.dart';
import 'package:menu_app/Specials/specialCartListBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'items.dart';

class ItemsDetails extends StatelessWidget {
  // const ItemsDetails({Key key}) : super(key: key);
  final Items item;
  // final Items item;

  ItemsDetails({this.item, Key key}) : super(key: key);

  final SpecialCartListBloc bloc = BlocProvider.getBloc<SpecialCartListBloc>();

  addToCart(Items items) {
    bloc.addToList(items);
  }

  @override
  Widget build(BuildContext context) {
    //BlocProvider takes list of blocs which returns SpecialCartListBloc.
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 40, 10),
      child: Stack(children: <Widget>[
        Container(
          width: 180.0,
          height: 150.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: Colors.brown[200],
          ),
          // child:Image.asset(image,fit: BoxFit.fill),
          child: Image.asset('system/public/foodItems/' + item.image),
        ),
        Positioned(
          left: 10.0,
          top: 120.0,
          child: Material(
            color: Colors.brown[50],
            elevation: 8.0,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              child: Column(
                children: <Widget>[
                  // SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      child: Center(
                          child: Text(item.title,
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
                      Text(" Rs." + item.price,
                          style: TextStyle(
                              color: Colors.brown,
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
                            style: TextStyle(
                                fontSize: 13, fontFamily: 'Lobster-Regular')),
                        onPressed: () {
                          // addToCart(items);

                          final snackbar = SnackBar(
                            content: Text('$item.name added to the cart.'),
                            duration: Duration(milliseconds: 600),
                          );
                          Scaffold.of(context).showSnackBar(snackbar);
                        },
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
