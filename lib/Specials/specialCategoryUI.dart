import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu_app/MenuGroup/imageCarousel.dart';
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

  Future<List<Items>> specialItems() async {
    var data = await http.get("http://192.168.254.1:8000/api/view_items/");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
    for (var itemval in jsonData) {
      Items items = Items(itemval['title'], itemval['name'], itemval['price'],
          itemval['image']);
      specialitems.add(items);
    }
    return specialitems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.home),
              backgroundColor: Colors.brown,
              title: Text('Home'),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                ImageCarousel(),
                SizedBox(height:40),
                FutureBuilder(
                  future: specialItems(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return Container(
                        height: 300,
                        // width: MediaQuery.of(context).size.width,
                  
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
            )));
  }
}
