import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItems.dart';

class OrderDetails extends StatefulWidget {
  final FoodItem orderItem;

  const OrderDetails({Key key, this.orderItem}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
   bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (_enabled) {
      _onPressed = () {
        final snackBar = SnackBar(
          content: Text('Order Delivered Successfully.'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      };
    }

    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30, bottom: 20, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.brown[100],
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(.30),
              offset: Offset(0, 0),
              // blurRadius: 40,
              // spreadRadius: 8,
            )
          ],
          color: Colors.white70,
        ),
        child: Column(children: <Widget>[
          Text(
            widget.orderItem.tableNo,
            style: TextStyle(
              fontFamily: 'Lobster-Regular',
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              isThreeLine: false,
              title: Text(
                widget.orderItem.cart.toString(),
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  // fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
              // subtitle: Text(
              //   '1',
              //   style: TextStyle(
              //     fontFamily: 'Rancho-Regular',
              //     // fontStyle: FontStyle.italic,
              //     fontSize: 20.0,
              //     color: Colors.brown,
              //   ),
              // ),
              trailing: Image.asset('images/pancake.jpg'),
            ),
          ),
          SizedBox(height: 5),
          RaisedButton(
            color: Colors.brown[100],
            elevation: 20,
            child: const Text('Deliver',
                style: TextStyle(fontSize: 18, fontFamily: 'Lobster-Regular')),
            onPressed: _onPressed,
          ),
          SwitchListTile(value: _enabled, onChanged: (bool value){
            setState(() {
              _enabled = value; 
            });
          })
        ]),
      ),
    );
  }
}
