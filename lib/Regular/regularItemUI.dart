import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'regularItems.dart';
import 'regularDetails.dart';


class BeverageItem extends StatefulWidget {
  BeverageItem({Key key}) : super(key: key);

  @override
  _BeverageItemState createState() => _BeverageItemState();
}

class _BeverageItemState extends State<BeverageItem> {
    List<RegularItems> regularitems = [];

  Future<List<RegularItems>> regularItems() async {
    var data = await http.get("http://192.168.254.1:8000/api/regular_item/");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
    for (var regitemval in jsonData) {
      RegularItems regitems = RegularItems(regitemval['name'], regitemval['description'], regitemval['price'],
          regitemval['image']);
      regularitems.add(regitems);
    }
    return regularitems;
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
                title(),
                FutureBuilder(
                  future: regularItems(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return Container(
                        height: 300,     
                        // width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return RegularDetails(
                                snapshot.data[index].name,
                                snapshot.data[index].description,
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

Widget title() {
  return Text(
  "Bevarage",
  style: TextStyle(
    fontSize:10,
    fontFamily: 'Rancho-Regular',
  ),
    
  );
}
