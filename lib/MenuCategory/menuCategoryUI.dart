import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'categories.dart';
import 'package:menu_app/Regular/regularItemUI.dart';
import 'categoriesDetails.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/CartPage/cartListBloc.dart';


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

    for (var i = 0; i < jsonData.length; i++) {
      final category = Categories.fromJson(jsonData[i]);
      menucategory.add(category);
    }
    return menucategory;
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [Bloc((i) => CartListBloc())],
    child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.menu),
              backgroundColor: Colors.brown,
              title: Text('Menu Category'),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                FutureBuilder(
                    future: menuCategory(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            height: 539,
                            child: GridView.builder(
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  Categories category = snapshot.data[index];

                                  return CategoriesDetails(
                                    category: category,
                                    
                                    action: () {
                                      print(category.id);
                                      print(category.name);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegularCategory(id: category.id, name: category.name)),);
                                    
                                    },
                                  );
                                  
                                }
                                ));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ))));
            
  }
}

