import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'cartListBloc.dart';
import 'dart:convert'; //to convert http response in json format
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<FoodItem> foodItems = new List<FoodItem>();
  var listUpdate = false;
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

    return BlocProvider(
        blocs: [Bloc((i) => CartListBloc())],
        child: StreamBuilder(
          stream: bloc.listStream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (!listUpdate) {
                foodItems = snapshot.data;
              }
              return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.brown,
                  title: Text('Food Cart'),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: CartBody(foodItems, updateList),
                ),
                bottomNavigationBar: BottomBar(foodItems, updateList),
              );
            } else {
              return Container();
            }
          },
        ));
  }

  void updateList(List<FoodItem> list) {
    setState(() {
      listUpdate = true;
      foodItems = list;
    });
  }
}

class BottomBar extends StatelessWidget {
  // final List<FoodItem> foodItems;
  List<FoodItem> foodItems;
  Function updateList;
  BottomBar(this.foodItems, this.updateList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(foodItems),
          Divider(
            height: 5,
            color: Colors.brown,
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
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<FoodItem> foodItems) {
    double totalAmount = 0.0;

    for (int i = 0; i < foodItems.length; i++) {
      totalAmount = totalAmount + foodItems[i].price * foodItems[i].Quantity;
    }
    return totalAmount.toStringAsFixed(2);
  }
}

class CartBody extends StatelessWidget {
  CartBody(this.foodItems, this.updateList);
  final List<FoodItem> foodItems;
  Function updateList;

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
        return ItemContent(
            foodItem: foodItems[index],
            foodItems: foodItems,
            updateList: updateList,
            index: index);
      },
    );
  }
}

class CustomQuantity extends StatefulWidget {
  final FoodItem foodItem;
  List<FoodItem> foodItems;
  Function updateList;
  int index;

  CustomQuantity(this.foodItem, this.foodItems, this.updateList, this.index);

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
      padding: EdgeInsets.all(4),
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                //  setState(() {});

                if (widget.foodItems[widget.index].Quantity > 1) {
                  widget.foodItems[widget.index].Quantity--;
                  print(widget.foodItems[widget.index].Quantity);
                  print(widget.foodItem.Quantity * widget.foodItem.price);
                } else {
                  removeFromList(widget.foodItems[widget.index]);
                  print('remove');
                }

                widget.updateList(widget.foodItems);
                //   return widget.cart.foodItems[widget.index].quantity;
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
            widget.foodItems[widget.index].Quantity.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.brown),
          ),
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                // setState(() {

                //   print(widget.foodItem.quantity);
                //   print(widget.foodItem.quantity * widget.foodItem.price);
                // });
                widget.foodItems[widget.index].Quantity++;
                widget.updateList(widget.foodItems);
                //    return widget.cart.foodItems[widget.index].quantity;
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
  const ItemContent(
      {Key key,
      @required this.foodItem,
      this.foodItems,
      this.updateList,
      this.index})
      : super(key: key);

  final FoodItem foodItem;
  final List<FoodItem> foodItems;
  final int index;
  final Function updateList;

  @override
  Widget build(BuildContext context) {
    var customQuantity = CustomQuantity(foodItem, foodItems, updateList, index);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'system/public/foodItems/' + foodItem.image,
                fit: BoxFit.fitHeight,
                height: 50,
                width: 70,
              ),
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'Rancho-regular',
                      color: Colors.brown,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text: foodItem.Name,
                    ),
                  ]),
            ),
            CustomQuantity(foodItem, foodItems, updateList, index),
            Text("\Rs ${foodItem.price * customQuantity.foodItem.Quantity}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rancho-regular',
                    fontSize: 21)),
          ],
        ),
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

  static final url = 'http://192.168.254.2:8000/api/order/';
  const PlaceOrder({Key key, this.foodItem}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  
  // var json = jsonDecode('url');
  // List<FoodItem> players = FoodItems.fromJson(json).foodItems;
   var foodItems= [FoodItem(Name: 'Chicken Spaghetti',Quantity: 1),FoodItem(Name: 'Onion Rings',Quantity: 1)];

   
    //List<FoodItem> foodItems = [];

  //List<FoodItem> foodItems = FoodItem.encondeToJson();
  var tableController = TextEditingController(text: 'Table-1');
  

  bool visible = false;

  // Future<FoodItem> requestOrder(String url, {Map body}) async {
  //   // Showing CircularProgressIndicator using state.
  //   setState(() {
  //     visible = true;
  //   });

  //   return http.post(url, headers: {"Content-Type": "application/x-www-form-urlencoded"}, body: body ).then((http.Response response) {
  //     print(foodItems);
  //     final int statusCode = response.statusCode;

  //     if (statusCode == 201) {
  //       setState(() {
  //         visible = false;
  //       });
  //       // throw new Exception("Error while fetching data");
  //     }

  //     return FoodItem.fromJson(json.decode(response.body));
  //   });
  // }

  Future<List<FoodItem>> requestOrder() async{
        final response = await http.post('http://192.168.254.2:8000/api/order/',
        headers: {'Content-Type':'application/json',},
        body: jsonEncode({
           'tableNo':tableController.text,
           'status': 0,
           'cart': foodItems,
    }),
    );
    print(foodItems);
    print(foodItems.length);
    print('statuscode = ' + response.statusCode.toString());
    return foodItems;
  }

// Future<List<FoodItem>> requestOrder() async{
//   var data = await http.post('http://192.168.254.2:8000/api/order/',headers: {'Content-Type':'application/json; charset=UTF-8'});
//   var jsonData = jsonDecode(data.body);
//   List<FoodItem> foodItems = FoodItems.fromJson(jsonData).foodItems;
//   FoodItem newFoodItem = FoodItem(tableNo: tableController.text, status: 0, cart: foodItems );
//   foodItems.add(newFoodItem);
//   String encode = jsonEncode(foodItems);

//   print(encode);
//   return foodItems;

// }

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
            Visibility(
                visible: visible,
                child: Container(child: CircularProgressIndicator())),
            FlatButton(
              onPressed: requestOrder,
//               onPressed: () async {
//                 // _validateInputs();

//                 FoodItem newFoodItem = new FoodItem(
//                     tableNo: tableController.text, 
//                     status: 0, 
//                     cart: ['Pancake',1]
//                     );
//                 FoodItem p = await requestOrder(PlaceOrder.url,
//                     body: newFoodItem.toMap() );
//                 print(p.cart);
//                 // Navigate to Profile Screen & Sending name to Next Screen.

//                 final snackBar =
//                     SnackBar(content: Text('Order Placed Successfully.'));

// // Find the Scaffold in the widget tree and use it to show a SnackBar.
//                 Scaffold.of(context).showSnackBar(snackBar);

//                 setState(() {
//                   visible = false;
//                 });
//               },
              // onPressed: () async {
              //   FoodItem items = new FoodItem(
              //     tableNo: tableController.text,
              //   );
              //   FoodItem p = await requestOrder(PlaceOrder.url,
              //       body: items.toMap());
              // },
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
        // Visibility(
        //     visible: visible,
        //     child: Container(child: CircularProgressIndicator())),
      ],
    );
  }
}
