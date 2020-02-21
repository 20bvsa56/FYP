import 'package:flutter/material.dart';
import 'package:menu_app/MenuGroup/imagecarousel.dart';


class SpecialCategory extends StatefulWidget {
  SpecialCategory({Key key}) : super(key: key);

  @override
  _SpecialCategoryState createState() => _SpecialCategoryState();
}

class _SpecialCategoryState extends State<SpecialCategory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Column(
          children: <Widget>[
            ImageCarousel(),
            //searchBar(),
            categories(),
          ],
        ),
      ),
    );
  }
}

Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(width: 50),
      Icon(Icons.search,
      color: Colors.black38),
      SizedBox(width: 20),
      Expanded(
        child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(vertical: 5),
        ),
      ),),SizedBox(width: 50),  
    ],
  );
}

class CategoryListItem  extends StatelessWidget {
  //creating member variables
  final String categoryTitle;
  final String categoryImage;
  final String categoryName;
  final String categoryPrice;
 

    CategoryListItem({
     this.categoryName,
     this.categoryImage,
     this.categoryPrice,
     this.categoryTitle,
   
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              width: 200.0,
               child: Card(
                 child: Wrap(
                   children: <Widget>[ 
                    Center(child:Text(categoryTitle,
                     style:TextStyle(
                          fontFamily: 'Lobster-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,     
                       ),
                      ),
                     ),
                     
                     Image.asset(categoryImage, fit: BoxFit.cover),

                     ListTile(
                       title: Text(categoryName,
                       style: TextStyle(
                          fontFamily: 'Rancho-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                       ),
                       ),
                       subtitle: Text(categoryPrice,
                       style:TextStyle(
                          fontFamily: 'Rancho-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,     
                       ),
                       ),
                      
                     ),
                   ],
                 ),
               )
            );
  }
}

Widget categories(){
  return Container(
    height: 320,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children:<Widget>[
        CategoryListItem(//custom widget
          categoryTitle: 'Beverage',
          categoryName: 'Valencia Fizz', 
          categoryPrice: 'Rs. 250',
          categoryImage: 'images/ValenciaFizz.jpg',
        ),
        CategoryListItem(
          categoryTitle: 'Breakfast',
          categoryName: 'Blueberry Pancake',
          categoryPrice: 'Rs. 400',
          categoryImage: 'images/pancake.jpg',
        ),
         CategoryListItem(//custom widget
          categoryTitle: 'Lunch',
          categoryName: 'Bacon Double Cheeseburger Grilled Cheese Sandwich', 
          categoryPrice: 'Rs. 320',
          categoryImage: 'images/bacon_cheese.jpg',
        ),
         CategoryListItem(//custom widget
          categoryTitle: 'Dinner',
          categoryName: 'Nepali Thakali Khana Set', 
          categoryPrice: 'Rs. 400',
          categoryImage: 'images/thakali.jpg',
        ),
      ],
    ),
  );
}






