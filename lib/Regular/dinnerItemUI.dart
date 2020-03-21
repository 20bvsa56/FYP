// import 'package:flutter/material.dart';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:menu_app/MenuGroup/menuCategory.dart';
// import 'package:menu_app/bloc/DinnerBloc/dinnerCartListBloc.dart';
// import 'package:menu_app/cart/dinnerFoodItem.dart';


// class DinnerItem extends StatelessWidget {
//   const DinnerItem({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       blocs: [Bloc((i) => DinnerCartListBloc())],
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
//         title: Text('Dinner Items'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: <Widget>[
//           displayDinner(),
//         ],
//       ),
//     );
//   }
// }

// Widget displayDinner() {
//   return Container(
//     margin: EdgeInsets.all(10),
//     padding: EdgeInsets.all(10),
//     decoration: new BoxDecoration(
//         //new Color.fromRGBO(255, 0, 0, 0.0),
//         borderRadius: new BorderRadius.all(Radius.circular(20))),
//     height: 510,
//     child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
//       for (var dinnerFoodItem in dinfoodItemList
//           .dinnerFoodItems) //loop through every breakfast items present in the list
//         DinnerItemContainer(
//             dinnerFoodItem:
//                 dinnerFoodItem) //passing breakfast to the container
//     ]),
//   );
// }

// class DinnerItemContainer extends StatelessWidget {
//   // const breakfastItemContainer({Key key}) : super(key: key);

//   final DinnerFoodItem dinnerFoodItem;

//   DinnerItemContainer({@required this.dinnerFoodItem});

//   final DinnerCartListBloc dinbloc =
//       BlocProvider.getBloc<DinnerCartListBloc>();

//   addToCart(DinnerFoodItem dinnerFoodItem) {
//     dinbloc.addToList(dinnerFoodItem);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         addToCart(dinnerFoodItem);

//         //snackar gives a message with an optional action which briefly displays at the bottom of the screen
//         final snackbar = SnackBar(
//           content: Text("${dinnerFoodItem.dinname} added to your food cart."),
//           duration: Duration(milliseconds: 2000),
//         );

//         Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
//       },

      
//       child: DinnerItems(
//         dinDescription: dinnerFoodItem.dindescription,
//         dinName: dinnerFoodItem.dinname,
//         dinImage: dinnerFoodItem.dinimage,
//         dinPrice: dinnerFoodItem.dinprice,
//       ),
//     );
//   }

//   void dispose() {
//     dinbloc.dispose();
//   }
// }

// class DinnerItems extends StatelessWidget {
//   //const breakfastItems({Key key}) : super(key: key);

//   DinnerItems({
//     @required this.dinImage,
//     @required this.dinName,
//     @required this.dinPrice,
//     @required this.dinDescription,
//   });

//   final String dinDescription;
//   final String dinName;
//   final String dinImage;
//   final int dinPrice;

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
//                 dinName,
//                 style: TextStyle(
//                   fontFamily: 'Rancho-Regular',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25.0,
//                 ),
//               ),
//               ListTile(
//                 title: Text(
//                   dinDescription,
//                   style: TextStyle(
//                     fontFamily: 'Rancho-Regular',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 subtitle: Text(
//                   "\Rs$dinPrice",
//                   style: TextStyle(
//                     fontFamily: 'Rancho-Regular',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//                 trailing: Image.asset(dinImage, fit: BoxFit.cover),
//               ),
//               SizedBox(width: 10),
//               RaisedButton(
//                 hoverElevation: 0,
//                 onPressed: () {},
//                 child:
//                     const Text('Add to Cart', style: TextStyle(fontSize: 15)),
//               ),
//             ],
//           ),
//         ));
//   }
// }
