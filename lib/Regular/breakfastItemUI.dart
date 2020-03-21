// import 'package:flutter/material.dart';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:menu_app/MenuGroup/menuCategory.dart';
// import 'package:menu_app/bloc/BreakfastBloc/breakfastCartListBloc.dart';
// import 'package:menu_app/cart/breakfastFoodItem.dart';

// class BreakfastItem extends StatelessWidget {
//   const BreakfastItem({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       blocs: [Bloc((i) => BreakfastCartListBloc())],
//       child: MaterialApp(
//         home: Home(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   Home({Key key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.chevron_left),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MenuCategory()),
//               );
//             }),
//         backgroundColor: Colors.brown,
//         title: Text('Breakfast Items'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: <Widget>[
//           displayBreakfast(),
//         ],
//       ),
//     );
//   }
// }

// Widget displayBreakfast() {
//   return Container(
//     margin: EdgeInsets.all(10),
//     padding: EdgeInsets.all(10),
//     decoration: new BoxDecoration(
//         //new Color.fromRGBO(255, 0, 0, 0.0),
//         borderRadius: new BorderRadius.all(Radius.circular(20))),
//     height: 510,
//     child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
//       for (var breakfastFoodItem in brefoodItemList
//           .breakfastFoodItems) //loop through every breakfast items present in the list
//         BreakfastItemContainer(
//             breakfastFoodItem:
//                 breakfastFoodItem) //passing breakfast to the container
//     ]),
//   );
// }

// class BreakfastItemContainer extends StatelessWidget {
//   // const breakfastItemContainer({Key key}) : super(key: key);

//   final BreakfastFoodItem breakfastFoodItem;

//   BreakfastItemContainer({@required this.breakfastFoodItem});


//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//        //showing the snackbar
//       },
//       child: BreakfastItems(
//         breDescription: breakfastFoodItem.bredescription,
//         breName: breakfastFoodItem.brename,
//         breImage: breakfastFoodItem.breimage,
//         brePrice: breakfastFoodItem.breprice, breakfastFoodItem: null,
//       ),
//     );
//   }
// }


// class BreakfastItems extends StatelessWidget {
//   //const breakfastItems({Key key}) : super(key: key);
//     final BreakfastFoodItem breakfastFoodItem;

//               final BreakfastCartListBloc brebloc =
//                   BlocProvider.getBloc<BreakfastCartListBloc>();

//               addToCart(BreakfastFoodItem breakfastFoodItem) {
//                 brebloc.addToList(breakfastFoodItem);
//               }
        
//   BreakfastItems({
//     @required this.breImage,
//     @required this.breName,
//     @required this.brePrice,
//     @required this.breDescription,
//     @required this.breakfastFoodItem,
//   });

//   final String breDescription;
//   final String breName;
//   final String breImage;
//   final int brePrice;
  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.transparent, //new Color.fromRGBO(255, 0, 0, 0.0),
//             borderRadius: new BorderRadius.only(
//                 topLeft: const Radius.circular(15.0),
//                 topRight: const Radius.circular(15.0),
//                 bottomLeft: const Radius.circular(10.0),
//                 bottomRight: const Radius.circular(10.0))),
//         child: Card(
//           color: Colors.brown[50],
//           margin: EdgeInsets.symmetric(vertical: 12),
//           child: Wrap(
//             children: <Widget>[
//               Text(
//                 breName,
//                 style: TextStyle(
//                   fontFamily: 'Rancho-Regular',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25.0,
//                 ),
//               ),
//               ListTile(
//                 title: Text(
//                   breDescription,
//                   style: TextStyle(
//                     fontFamily: 'Rancho-Regular',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 subtitle: Text(
//                   "\Rs$brePrice",
//                   style: TextStyle(
//                     fontFamily: 'Rancho-Regular',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//                 trailing: Image.asset(breImage, fit: BoxFit.cover),
//               ),
//               SizedBox(width: 10),
//              RaisedButton(
//                 hoverElevation: 0,
//                 onPressed: () {
//                   addToCart(breakfastFoodItem);

//         //snackar gives a message with an optional action which briefly displays at the bottom of the screen
//         final snackbar = SnackBar(
//           content: Text("${breakfastFoodItem.brename} added to your food cart."),
//           duration: Duration(milliseconds: 2000),
//         );

//         Scaffold.of(context).showSnackBar(snackbar); 
//                 },
//                 child:
//                     const Text('Add to Cart', style: TextStyle(fontSize: 15)),
//               ),
//             ],
//           ),
//         ),
//      );
      
//   }
// }
    