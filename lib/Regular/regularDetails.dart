import 'package:flutter/material.dart';
import 'package:menu_app/CartPage/cartListBloc.dart';
import 'package:menu_app/CartPage/listTileColorBloc.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class RegularDetails extends StatelessWidget {
  // const RegularDetails({Key key}) : super(key: skey);
  // final RegularItems item;
  final RegularItems ritem;

  RegularDetails({this.ritem, key}) : super(key: key);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(RegularItems ritems) {
    bloc.addToList(ritems);
  }

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        blocs: [Bloc((i) => CartListBloc()),
                Bloc((i) => ColorBloc())
         ],child:Padding(
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
            ritem.name,
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
                ritem.description,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
              subtitle: Text(
                "Rs. " + ritem.price.toString(),
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
              trailing: Image.asset('system/public/foodItems/' + ritem.image),
            ),
          ),
          
           RaisedButton(
              color: Colors.brown[100],
              elevation: 20,
              child: const Text('Add to Cart',
                  style:
                      TextStyle(fontSize: 13, fontFamily: 'Lobster-Regular')),
              onPressed: () {
                  addToCart(ritem);
                  print(ritem.price);

                 final snackBar = SnackBar(
                  content: Text('${ritem.name} added to food cart.'),
                  duration: Duration(milliseconds: 550),
                );

                Scaffold.of(context).showSnackBar(snackBar);

               
              },
            ),
          
        ]),
      ),
    ));
  }
}
