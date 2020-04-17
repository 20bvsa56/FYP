import 'package:flutter/material.dart';
import 'package:menu_app/CartPage/cartListBloc.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class RegularDetails extends StatelessWidget {
  // const RegularDetails({Key key}) : super(key: skey);
  // final RegularItems item;
  final FoodItem foodItem;

  RegularDetails({this.foodItem, key}) : super(key: key);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItems) {
    bloc.addToList(foodItems);
  }


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
            foodItem.name,
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
                foodItem.description,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
              subtitle: Text(
                "Rs. " + foodItem.price.toString(),
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
              trailing: Image.asset('system/public/foodItems/' + foodItem.image),
            ),
          ),
          
           RaisedButton(
              color: Colors.brown[100],
              elevation: 20,
              child: const Text('Add to Cart',
                  style:
                      TextStyle(fontSize: 13, fontFamily: 'Lobster-Regular')),
              onPressed: () {
                  addToCart(foodItem);
                 
                 final snackBar = SnackBar(
                  content: Text('${foodItem.name} added to food cart.'),
                  duration: Duration(milliseconds: 550),
                );

                Scaffold.of(context).showSnackBar(snackBar);

               
              },
            ),
          
        ]),
      ),
    );
  }
}
