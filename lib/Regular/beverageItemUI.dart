import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/BeverageBloc.dart/beverageCartListBloc.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
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
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuCategory()),
              );
            }),
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
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
        //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    height: 500,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var beverageFoodItem in bevfoodItemList
          .beverageFoodItems) //loop through every beverage items present in the list
        BeverageItemContainer(
            beverageFoodItem:
                beverageFoodItem) //passing beverages to the container
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
        decoration: BoxDecoration(
            color: Colors.transparent, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: const Radius.circular(10.0),
                bottomRight: const Radius.circular(10.0))),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Wrap(
            children: <Widget>[
              Text(
              bevName,
              style: TextStyle(
                fontFamily: 'Rancho-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
              ListTile(
                title: Text(
                  bevDescription,
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
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
                trailing: Image.asset(bevImage, fit: BoxFit.cover),
                
              ),
              
        RaisedButton(
          hoverElevation: 0,
          onPressed: () {},
          child: const Text(
            'Add to Cart',
            style: TextStyle(fontSize: 15)
          ),
        ),
            ],
          ),
        ));
  }
}
