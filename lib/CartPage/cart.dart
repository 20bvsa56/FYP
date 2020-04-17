import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'cartListBloc.dart';
import 'orderModel.dart';
import 'dart:convert'; //to convert http response in json format
import 'package:http/http.dart' as http;

class Cart extends StatelessWidget {
  const Cart({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<FoodItem> foodItems;
    return BlocProvider(
        blocs: [Bloc((i) => CartListBloc())],
        child: StreamBuilder(
          stream: bloc.listStream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              foodItems = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.brown,
                  title: Text('Food Cart'),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: CartBody(foodItems),
                ),
                bottomNavigationBar: BottomBar(foodItems),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

class BottomBar extends StatelessWidget {
  final List<FoodItem> foodItems;

  BottomBar(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(foodItems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          PlaceOrder(),
        ],
      ),
    );
  }

  Container totalAmount(List<FoodItem> foodItems) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Text(
            "\Rs ${returnTotalAmount(foodItems)}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<FoodItem> foodItems) {
    double totalAmount = 0.0;

    for (int i = 0; i < foodItems.length; i++) {
      totalAmount = totalAmount + foodItems[i].price * foodItems[i].quantity;
    }
    return totalAmount.toStringAsFixed(2);
    
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Center(
        child: Column(
          children: <Widget>[
            Table(),
            //CustomBar(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: foodItems.length > 0 ? foodItemList() : noItemContainer(),
            )
          ],
        ),
      ),
    );
  }

  Container noItemContainer() {
    return Container(
        child: Center(
            child: Text(
      "No food item in the cart.",
      style: TextStyle(
        color: Colors.black26,
        fontSize: 25,
        fontStyle: FontStyle.italic,
        fontFamily: 'Rancho-Regular',
      ),
    )));
  }

  ListView foodItemList() {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return ItemContent(foodItem: foodItems[index]);
      },
    );
  }
}

class CustomQuantity extends StatefulWidget {
  final FoodItem foodItem;

  CustomQuantity(this.foodItem);

  @override
  _CustomQuantityState createState() => _CustomQuantityState();
}

class _CustomQuantityState extends State<CustomQuantity> {
  final double _buttonWidth = 28;

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  removeFromList(FoodItem foodItems) {
    bloc.removeFromList(foodItems);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(5),
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  if (widget.foodItem.quantity > 1) {
                    widget.foodItem.quantity--;
                    print(widget.foodItem.quantity);
                  } else {
                    removeFromList(widget.foodItem);
                    print('remove');
                  }
                });
              },
              child: Text(
                "-",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: Colors.brown),
              ),
            ),
          ),
          Text(
            widget.foodItem.quantity.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.brown),
          ),
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.foodItem.quantity++;
                  print(widget.foodItem.quantity);
                });
              },
              child: Text(
                "+",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.brown),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  const ItemContent({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    CustomQuantity qty = CustomQuantity(foodItem);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'system/public/foodItems/' + foodItem.image,
              fit: BoxFit.fitHeight,
              height: 55,
              width: 80,
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Rancho-regular',
                    color: Colors.brown,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: foodItem.name,
                  ),
                ]),
          ),
          CustomQuantity(foodItem),
          Text("\Rs ${qty.foodItem.quantity * foodItem.price}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rancho-regular',
                  fontSize: 23)),
        ],
      ),
    );
  }
}

class Table extends StatelessWidget {
  const Table({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tableController = TextEditingController(text: '    Table-1');
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(130, 0, 130, 0),
        child: TextFormField(
          controller: tableController,
          enabled: false,
          style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Rancho-Regular'),
        ),
      ),
    );
  }
}

class PlaceOrder extends StatefulWidget {
  final FoodItem foodItem;

  const PlaceOrder({Key key, this.foodItem}) : super(key: key);

  static final url = 'http://192.168.254.2:8000/api/order/';

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool visible = false;

  Future<OrderModel> placeOrder(String url, {Map body}) async {
    // Showing CircularProgressIndicator using state.
    setState(() {
      visible = true;
    });

    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode == 201) {
        setState(() {
          visible = false;
        });
        // throw new Exception("Error while fetching data");
      }

      return OrderModel.fromJson(json.decode(response.body));
    });
  }

  final TextEditingController tableController = new TextEditingController();
  final TextEditingController nameController =
      new TextEditingController(text: 'foodItem.name');
  final TextEditingController quantityController =
      new TextEditingController(text: 'foodItem.quantity');

  Future<void> confirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order placement confirmation.',
              style: TextStyle(
                fontFamily: 'Lobster-regular',
                fontSize: 18,
              )),

          content: Text('Do you wish to place order?',
              style: TextStyle(fontFamily: 'Lobster-regular', fontSize: 14)),
          actions: <Widget>[
            FlatButton(
              onPressed: () async {
                // _validateInputs();
                OrderModel newOrderModel = new OrderModel(
                    tableNo: tableController.text,
                    item: nameController.text,
                    quantity: quantityController.text);
                OrderModel p =
                    await placeOrder('url', body: newOrderModel.toMap());
                print(p.tableNo);

                setState(() {
                  visible = false;
                });
              },
              child: Text('Yes',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lobster-regular',
                      fontSize: 20)),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-regular',
                        fontSize: 20))),
          ],
          elevation: 24,
          backgroundColor: Colors.white,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          //shape: CircleBorder(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
          child: RaisedButton(
            color: Colors.grey[400],
            elevation: 18,
            onPressed: confirmation,
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
        ),
        Visibility(
            visible: visible,
            child: Container(child: CircularProgressIndicator())),
      ],
    );
  }
}
