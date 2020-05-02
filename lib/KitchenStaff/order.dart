import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'orderDetails.dart';

class Order extends StatefulWidget {
  const Order({Key key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  List<FoodItem> orders = [];

  Future<List<FoodItem>> orderList() async {
    var data = await http.get("http://192.168.254.2:8000/api/order/");
    var jsonData = json.decode(data.body);

    for (var i = 0; i < jsonData.length; i++) {
      final order = FoodItem.fromJson(jsonData[i]);
      orders.add(order);
    }
    return orders;
  }

  Future<Null> refreshPage() async {
    refreshkey.currentState?.show(
        atTop:
            true); // change atTop to false to show progress indicator at bottom
    await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      orderList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => Navigator.pop(context, false),
              ),
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.fastfood),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
              backgroundColor: Colors.brown,
              title: Text('Food Order'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: orderList(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        return Container(
                          height: 600,

                          // height: MediaQuery.of(context).size.height,
                          child: RefreshIndicator(
                            onRefresh: refreshPage,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  FoodItem orderItem = snapshot.data[index];

                                  return OrderDetails(
                                    orderItem: orderItem,
                                  );
                                }),
                          ),
                        );
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100, 200, 0, 0),
                            child: Container(
                              height: 50,
                              width: 180,
                              child: Text(
                                'No orders yet!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Rancho-Regular',
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
