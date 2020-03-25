import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:menu_app/MenuGroup/categoryGrid.dart';
import 'dart:convert';
import 'dart:async';
import 'categories.dart';
import 'categoriesDetails.dart';



class MenuCategory extends StatefulWidget {
  MenuCategory({Key key}) : super(key: key);

  @override
  _MenuCategoryState createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {
  List<Categories> menucategory = [];

  Future<List<Categories>> menuCategory() async {
    var data = await http.get("http://192.168.254.2:8000/api/category/");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
    for (var catval in jsonData) {
      Categories categories = Categories( catval['id'],catval['name'], catval['image']);
      menucategory.add(categories);
    }
    return menucategory;
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.home),
              backgroundColor: Colors.brown,
              title: Text('Menu Category'),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[ 
                FutureBuilder(
                  future: menuCategory(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return Container(
                        height: 539,     
                        // height: MediaQuery.of(context).size.height,
                        child:new GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return CategoriesDetails(
                                snapshot.data[index].id,
                                snapshot.data[index].name,
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
