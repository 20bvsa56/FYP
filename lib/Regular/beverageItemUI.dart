import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/BeverageBloc.dart/beverageCartListBloc.dart';
import 'package:menu_app/cart/beverageFoodItem.dart';

class BeverageItem extends StatelessWidget {
  const BeverageItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => BeverageCartListBloc())],
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Beverage Items'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          displayBeverage(),
        ],
      ),
    );
  }
}

Widget displayBeverage() {
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
           //new Color.fromRGBO(255, 0, 0, 0.0),
                  borderRadius: new BorderRadius.all(Radius.circular(20))
                ),
    height: 100,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var beverageFoodItem in bevfoodItemList
          .beverageFoodItems) //loop through every beverage items present in the list
        BeverageItemContainer(
            beverageFoodItem:
                beverageFoodItem),//passing beverages to the container
    ]),
  );
}

class BeverageItemContainer extends StatelessWidget {
  // const BeverageItemContainer({Key key}) : super(key: key);

  final BeverageFoodItem beverageFoodItem;

  BeverageItemContainer({@required this.beverageFoodItem});

  final BeverageCartListBloc bevbloc =
      BlocProvider.getBloc<BeverageCartListBloc>();

  addToCart(BeverageFoodItem beverageFoodItem) {
    bevbloc.addToList(beverageFoodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(beverageFoodItem);

        //snackar gives a message with an optional action which briefly displays at the bottom of the screen
        final snackbar = SnackBar(
          content: Text("${beverageFoodItem.bevname} added to your food cart."),
          duration: Duration(milliseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
      },
      child: BeverageItems(
        bevDescription: beverageFoodItem.bevdescription,
        bevName: beverageFoodItem.bevname,
        bevImage: beverageFoodItem.bevimage,
        bevPrice: beverageFoodItem.bevprice,
      ),
    );
  }

  void dispose() {
    bevbloc.dispose();
  }
}

class BeverageItems extends StatelessWidget {
  //const BeverageItems({Key key}) : super(key: key);

  BeverageItems({
    @required this.bevImage,
    @required this.bevName,
    @required this.bevPrice,
    @required this.bevDescription,
  });

  final String bevDescription;
  final String bevName;
  final String bevImage;
  final int bevPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
        child: Card(
      child: Wrap(
        children: <Widget>[
          Center(
            child: Text(
              bevName,
              style: TextStyle(
                fontFamily: 'Lobster-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Image.asset(bevImage, fit: BoxFit.cover),
          ListTile(
            title: Text(
              bevDescription,
              style: TextStyle(
                fontFamily: 'Rancho-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            subtitle: Text(
              "\Rs$bevPrice",
              style: TextStyle(
                fontFamily: 'Rancho-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
