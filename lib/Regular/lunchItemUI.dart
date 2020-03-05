import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
import 'package:menu_app/bloc/LunchBloc/lunchCartListBloc.dart';
import 'package:menu_app/cart/lunchFoodItem.dart';


class LunchItem extends StatelessWidget {
  const LunchItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => LunchCartListBloc())],
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
        backgroundColor: Colors.brown,
        title: Text('Lunch Items'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          displayLunch(),
        ],
      ),
    );
  }
}

Widget displayLunch() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
        //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    height: 510,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var lunchFoodItem in lunfoodItemList
          .lunchFoodItems) //loop through every breakfast items present in the list
        LunchItemContainer(
            lunchFoodItem:
                lunchFoodItem) //passing breakfast to the container
    ]),
  );
}

class LunchItemContainer extends StatelessWidget {
  // const breakfastItemContainer({Key key}) : super(key: key);

  final LunchFoodItem lunchFoodItem;

  LunchItemContainer({@required this.lunchFoodItem});

  final LunchCartListBloc lunbloc =
      BlocProvider.getBloc<LunchCartListBloc>();

  addToCart(LunchFoodItem lunchFoodItem) {
    lunbloc.addToList(lunchFoodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(lunchFoodItem);

        //snackar gives a message with an optional action which briefly displays at the bottom of the screen
        final snackbar = SnackBar(
          content: Text("${lunchFoodItem.lunname} added to your food cart."),
          duration: Duration(milliseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
      },
      child: LunchItems(
        lunDescription: lunchFoodItem.lundescription,
        lunName: lunchFoodItem.lunname,
        lunImage: lunchFoodItem.lunimage,
        lunPrice: lunchFoodItem.lunprice,
      ),
    );
  }

  void dispose() {
    lunbloc.dispose();
  }
}

class LunchItems extends StatelessWidget {
  //const breakfastItems({Key key}) : super(key: key);

  LunchItems({
    @required this.lunImage,
    @required this.lunName,
    @required this.lunPrice,
    @required this.lunDescription,
  });

  final String lunDescription;
  final String lunName;
  final String lunImage;
  final int lunPrice;

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
          color: Colors.brown[50],
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Wrap(
            children: <Widget>[
              Text(
                lunName,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              ListTile(
                title: Text(
                  lunDescription,
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  "\Rs$lunPrice",
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: Image.asset(lunImage, fit: BoxFit.cover),
              ),
              SizedBox(width: 10),
              RaisedButton(
                hoverElevation: 0,
                onPressed: () {},
                child:
                    const Text('Add to Cart', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ));
  }
}
