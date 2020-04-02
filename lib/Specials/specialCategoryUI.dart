import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu_app/MenuGroup/imageUI.dart';
import 'dart:convert';
import 'dart:async';
import 'items.dart';
import 'itemsDetails.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:menu_app/Specials/specialCartListBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class SpecialCategory extends StatefulWidget {
  SpecialCategory({Key key}) : super(key: key);

  @override
  _SpecialCategoryState createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  List<Items> specialitems = [];

  Future<List<Items>> specialItems() async {
    var data = await http.get("http://192.168.254.2:8000/api/special/");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
  //   for (var itemval in jsonData) {
  //     Items items = Items(itemval['quantity'],itemval['items'],itemval['title'], itemval['name'], itemval['price'],itemval['image']);
  //     specialitems.add(items);
  //   }
  //   return specialitems;
  // }
   for (var i = 0; i < jsonData.length; i++) {
      final category = Items.fromJson(jsonData[i]);
      specialitems.add(category);
    }
    return specialitems;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => SpecialCartListBloc())],
      child:MaterialApp(
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
                // ImageCarousel(),

                BannerImage(),
                maintitle(),
                FutureBuilder(
                  future: specialItems(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 320,
                        // width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                               Items item = snapshot.data[index];
                              return ItemsDetails(
                               item: item,
                              );
                            }),
                      );
                    } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100,150,0,0),
                            child: Container(
                              
                              height: 50,
                              width: 180,
                              child:  Text('No special item!',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: 'Rancho-Regular',
                                              ),),
                            ),
                          ),
                        );
                    }
                  },
                ),
              ],
            ))));
  }
}

Widget maintitle() {
  return Container(
    child: TyperAnimatedTextKit(
      text: ["Today\'s Special"],
      textStyle: TextStyle(
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        fontFamily: 'Pacifico-Regular',
        color: Colors.black,
      ),
      speed: Duration(milliseconds: 100),
      isRepeatingAnimation: false,
    ),
  );
}
