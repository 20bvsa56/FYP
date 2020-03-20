import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'items.dart';
import 'itemsDetails.dart';

class SpecialCategory extends StatefulWidget {
  SpecialCategory({Key key}) : super(key: key);

  @override
  _SpecialCategoryState createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  List<Items> specialitems = [];

  Future<List<Items>> _specialItems() async {
    var data = await http.get("http://192.168.254.1:8000/api/view_items");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
    for (var itemval in jsonData) {
      Items items = Items(itemval['title'], itemval['name'], itemval['price'], itemval['image']);
      specialitems.add(items);
    }
    return specialitems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.home),
              backgroundColor: Colors.brown,
              title: Text('Home'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: _specialItems(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.brown[50],
                        child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemsDetails(
                                snapshot.data[index].title,
                                snapshot.data[index].name,
                                snapshot.data[index].price,
                                snapshot.data[index].image,
                              );
                            }),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text("Loading"),
                        ),
                      );
                    }
                  },
                ),
              ],
            ))));
  }
}



