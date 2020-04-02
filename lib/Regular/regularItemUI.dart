import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'regularItems.dart';
import 'regularDetails.dart';

class RegularCategory extends StatefulWidget {
  final int id;
  final String name;
  RegularCategory({Key key, this.id, this.name}) : super(key: key);

  @override
  _RegularCategoryState createState() => _RegularCategoryState();
}

class _RegularCategoryState extends State<RegularCategory> {
  List<RegularItems> regularitems = [];

  Future<List<RegularItems>> regularItems(int id) async {
    var data = await http.get("http://192.168.254.2:8000/api/item/$id");
    var jsonData = json.decode(data.body);

    print(id);
    //looping thorugh json data and getting details, adding in constructor and then list
    for (var regitemval in jsonData) {
      RegularItems regitems = RegularItems(regitemval['name'],
          regitemval['description'], regitemval['price'], regitemval['image']);
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
              title: Text(widget.name),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: regularItems(widget.id),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        return Container(
                          height: 539,

                          // height: MediaQuery.of(context).size.height,

                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
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
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100, 200, 0, 0),
                            child: Container(
                              height: 50,
                              width: 180,
                              child: Text(
                                'No food item!',
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