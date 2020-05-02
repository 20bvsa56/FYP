import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItems.dart';

class OrderDetails extends StatelessWidget {

  final FoodItem orderItem;

  const OrderDetails({Key key,this.orderItem}) : super(key: key);

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
            orderItem.name,
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
                orderItem.quantity.toString(),
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
              trailing: Image.asset('system/public/foodItems/' + orderItem.image),
            ),
          ),
        
        ]),
      ),
    );

  }
}