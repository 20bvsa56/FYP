import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
import 'package:menu_app/bloc/SpaghettiBloc/spaghettiCartListBloc.dart';
import 'package:menu_app/cart/spaghettiFoodItem.dart';

class SpaghettiItem extends StatelessWidget {
  const SpaghettiItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => SpaghettiCartListBloc())],
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
        title: Text('Spaghetti Items'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          displaySpaghetti(),
        ],
      ),
    );
  }
}

Widget displaySpaghetti() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
        //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    height: 510,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var spaghettiFoodItem in spafoodItemList
          .spaghettiFoodItems) //loop through every breakfast items present in the list
        SpaghettiItemContainer(
            spaghettiFoodItem:
                spaghettiFoodItem) //passing breakfast to the container
    ]),
  );
}

class SpaghettiItemContainer extends StatelessWidget {
  // const breakfastItemContainer({Key key}) : super(key: key);

  final SpaghettiFoodItem spaghettiFoodItem;

  SpaghettiItemContainer({@required this.spaghettiFoodItem});

  final SpaghettiCartListBloc spabloc =
      BlocProvider.getBloc<SpaghettiCartListBloc>();

  addToCart(SpaghettiFoodItem spaghettiFoodItem) {
    spabloc.addToList(spaghettiFoodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(spaghettiFoodItem);

        //snackar gives a message with an optional action which briefly displays at the bottom of the screen
        final snackbar = SnackBar(
          content: Text("${spaghettiFoodItem.spaname} added to your food cart."),
          duration: Duration(milliseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
      },
      child: LunchItems(
        spaDescription: spaghettiFoodItem.spadescription,
        spaName: spaghettiFoodItem.spaname,
        spaImage: spaghettiFoodItem.spaimage,
        spaPrice: spaghettiFoodItem.spaprice,
      ),
    );
  }

  void dispose() {
    spabloc.dispose();
  }
}

class LunchItems extends StatelessWidget {
  //const breakfastItems({Key key}) : super(key: key);

  LunchItems({
    @required this.spaImage,
    @required this.spaName,
    @required this.spaPrice,
    @required this.spaDescription,
  });

  final String spaDescription;
  final String spaName;
  final String spaImage;
  final int spaPrice;

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
                spaName,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              ListTile(
                title: Text(
                  spaDescription,
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  "\Rs$spaPrice",
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: Image.asset(spaImage, fit: BoxFit.cover),
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
