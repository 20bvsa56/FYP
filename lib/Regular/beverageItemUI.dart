import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'bevItems.dart';
import 'beverageDetails.dart';


class BeverageItem extends StatefulWidget {
  BeverageItem({Key key}) : super(key: key);

  @override
  _BeverageItemState createState() => _BeverageItemState();
}

class _BeverageItemState extends State<BeverageItem> {
    List<BeverageItems> beverageitems = [];

  Future<List<BeverageItems>> beverageItems() async {
    var data = await http.get("http://192.168.254.1:8000/api/beverage/");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
    for (var bevitemval in jsonData) {
      BeverageItems bevitems = BeverageItems(bevitemval['name'], bevitemval['description'], bevitemval['price'],
          bevitemval['image']);
      beverageitems.add(bevitems);
    }
    return beverageitems;
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
                  future: beverageItems(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return Container(
                        height: 300,     
                        // width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BeverageDetails(
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
