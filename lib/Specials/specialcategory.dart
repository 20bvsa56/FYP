import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/Cart/specialFoodItem.dart';
import 'package:menu_app/MenuGroup/imagecarousel.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:menu_app/specialbloc/specialCartListBloc.dart';

class CustomAppBar extends AppBar {
  // const CustomAppBar({Key key}) : super(key: key);
  //CustomAppBar({Key key, Widget title, Widget leading}): super(key:key, title:title,  leading:leading, backgroundColor: Colors.black, centerTitle:true);

  final SpecialCartListBloc sbloc = BlocProvider.getBloc<SpecialCartListBloc>();

  Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.only(bottom:10),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: sbloc.listStream,
                builder: (context, snapshot){

                List<SpecialFoodItem> specialFoodItems = snapshot.data;

                int length = specialFoodItems != null ? specialFoodItems : 0;//if food items var or snapshot not null

                return buildGestureDetector (length, context, specialFoodItems);
                  
                },
          )
            ]
          ),
      );
  }
}

GestureDetector buildGestureDetector(int length, BuildContext context, List<SpecialFoodItem> specialFoodItems){
  return GestureDetector(
        onTap: (){

        },
          child: Container(
              margin: EdgeInsets.only(right:10),
              child: Text('length.toString()',
              style: TextStyle(
                color:Colors.black,
                fontSize: 20,
              ) ),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
        ),
      );
}

class SpecialCategory  extends StatelessWidget {
  const SpecialCategory ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      blocs: [
        Bloc((i)=>SpecialCartListBloc())
      ],
      child:MaterialApp(
        home:Home(),
        debugShowCheckedModeBanner: false,
    ), 
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: <Widget>[
              ImageCarousel(),
              maintitle(),
              SizedBox(height:10),
              //searchBar(),
              display(),
            ],
          ),
        );
  }
}

Widget maintitle(){
  return Container(
    child:TyperAnimatedTextKit(
      text: ["Today\'s Special"],
      textStyle: TextStyle(
        fontSize: 25.0, 
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

Widget display(){
 return Container(
    height: 280,
    child: ListView(
       scrollDirection: Axis.horizontal,
       children:<Widget>[
          for (var specialFoodItem in sfoodItemList.specialFoodItems)//loop through every food items present in the list
          SpecialItemContainer(specialFoodItem : specialFoodItem)//passing fooditem to the container
       ]
   ),
 );
}

class SpecialItemContainer extends StatelessWidget {
  //const SpecialItemContainer({Key key}) : super(key: key);
  final SpecialFoodItem specialFoodItem;

  SpecialItemContainer({@required this.specialFoodItem});

  final SpecialCartListBloc sbloc = BlocProvider.getBloc<SpecialCartListBloc>();
  
  addToCart(SpecialFoodItem specialFoodItem){
    sbloc.addToList(specialFoodItem);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        addToCart(specialFoodItem);

        final snackbar = SnackBar(
          content: Text("${specialFoodItem.stitle} added to the cart."),
          duration: Duration(milliseconds: 2000),  
        );
        
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: SpecialItems(
        specialTitle: specialFoodItem.stitle,
        specialName: specialFoodItem.sname,
        specialImage: specialFoodItem.simage,
        specialPrice: specialFoodItem.sprice,
      ),
    );
  }
}

class SpecialItems extends StatelessWidget {
  // const SpecialItems({Key key}) : super(key: key);

  SpecialItems({
    @required this.specialImage,
    @required this.specialName,
    @required this.specialPrice,
    @required this.specialTitle,
  });

  final String specialTitle;
  final String specialName;
  final String specialImage;
  final String specialPrice;

  @override
  Widget build(BuildContext context) {
     return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              width: 200.0,
             
               child: Card(
                 child: Wrap(
                   children: <Widget>[ 
                    Center(child:Text(specialTitle,
                     style:TextStyle(
                          fontFamily: 'Lobster-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,     
                       ),
                      ),
                     ),
                     
                     Image.asset(specialImage, fit: BoxFit.cover),

                     ListTile(
                       title: Text(specialName,
                       style: TextStyle(
                          fontFamily: 'Rancho-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                       ),
                       ),
                       subtitle: Text(specialPrice,
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
          hintText: 'Search Special',
          contentPadding: EdgeInsets.symmetric(vertical: 5),
        ),
      ),),SizedBox(width: 50),  
    ],
  );
}
