import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'cartListBloc.dart';
import 'dart:math';
import 'dart:convert'; //to convert http response in json format
import 'package:http/http.dart' as http; //to handle http request

class FoodCart extends StatefulWidget {
  const FoodCart({Key key}) : super(key: key);

  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  // Getting entered value from TextField widget.
  final tableController = TextEditingController();
  final orderNumController = TextEditingController();
  final itemController = TextEditingController();
  final quantityController = TextEditingController();
  final totalAmountController = TextEditingController();
 
//creating a async function
  Future orderPlacement() async {
    // Showing CircularProgressIndicator using state.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String orderNum = totalAmountController.text;
    String totalAmount = totalAmountController.text;

    //server api url
    var url = 'http://192.168.254.2:8000/api/order/';
    

    // Store all data with Param Name.
    var data = {'orderNum': orderNum, 'totalAmount': totalAmount};

    // Starting  API Call.
    var response = await http.post(url, body: json.encode(data),
      	           headers: {'Accept':'application/json'});

    // Getting Server response into variable.

    var message = jsonDecode(response.body);
    // print(message.toString());

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<RegularItems> ritems;

    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          ritems = snapshot.data;
          return Scaffold(
            body: SafeArea(child: Container(child: CartBody(ritems))),
            bottomNavigationBar: BottomBar(ritems),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<RegularItems> ritems;

  BottomBar(this.ritems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(ritems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          //persons(),
          PlaceOrder(),
        ],
      ),
    );
  }
}

class PlaceOrder extends StatelessWidget {
  
  const PlaceOrder({Key key}) : super(key: key);

  void orderNum() {
    var random = new Random();
    // Printing Random Number between 1 to 10000 on Terminal Window.
    print(random.nextInt(10000));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
      child: RaisedButton(
        color: Colors.grey[400],
        elevation: 18,
        onPressed: (){
          orderNum();
            final snackBar = SnackBar(
                  content: Text('Your order has been placed.'),
                  duration: Duration(milliseconds: 2000),
                );

                Scaffold.of(context).showSnackBar(snackBar);
               
        },
        child: Text('Place Order',
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Rancho-Regular',
            )),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15),
          side: BorderSide(color: Colors.brown, width: 2),
        ),
      ),
    ));
  }
}

Container totalAmount(List<RegularItems> ritems) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total:",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.brown),
        ),
        Text(
          "\Rs.${returnTotalAmount(ritems)}",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          
        ),
      ],
    ),
  );
}

String returnTotalAmount(List<RegularItems> ritems) {
  double totalAmount = 0.0;
  
  for (int i = 0; i < ritems.length; i++) {
    totalAmount = totalAmount + ritems[i].price * ritems[i].quantity;
  }
  return totalAmount.toStringAsFixed(2);
  
}

class CartBody extends StatelessWidget {
  final List<RegularItems> ritems;

  const CartBody(this.ritems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.brown,
        title: Text('Food Cart'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        title(),
        Expanded(
          flex: 1,
          child: ritems.length > 0 ? foodItemList(ritems) : noItemContainer(),
        ),
      ]),
    );
  }
}

Widget title() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Your",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.brown,
                fontFamily: 'Lobster-Regular',
              ),
            ),
            Text(
              "        Order",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic
                  // fontFamily: 'Pacifico-Regular',
                  ),
            ),
          ],
        )
      ],
    ),
  );
}

Container noItemContainer() {
  return Container(
    child: Center(
      child: Text(
        'No food item in the cart.',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontFamily: 'Rancho-Regular',
        ),
      ),
    ),
  );
}

ListView foodItemList(ritems) {
  return ListView.builder(
    itemCount: ritems.length,
    itemBuilder: (builder, index) {
      return CartListItem(
        ritem: ritems[index],
      );
    },
  );
}

class CartListItem extends StatelessWidget {
  final RegularItems ritem;
  const CartListItem({Key key, this.ritem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ItemContent(ritem: ritem),
    );
  }
}

class ItemContent extends StatelessWidget {
  final RegularItems ritem;
  const ItemContent({Key key, this.ritem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: ritem.quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rancho-Regular',
                      )),
                  TextSpan(
                      text: " x ",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  TextSpan(
                    text: ritem.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rancho-Regular',
                    ),
                  ),
                  TextSpan(
                      text: "  =",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rancho-Regular')),
                ]),
              ),
              Text("\Rs.  ${ritem.quantity * ritem.price}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rancho-Regular'))
            ],
          ),
        ),
      ),
    );
  }
}