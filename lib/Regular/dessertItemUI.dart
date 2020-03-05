import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
import 'package:menu_app/bloc/DessertBloc/dessertCartListBloc.dart';
import 'package:menu_app/cart/dessertFoodItem.dart';

class DessertItem extends StatelessWidget {
  const DessertItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => DessertCartListBloc())],
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
        title: Text('Dessert Items'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          displayDessert(),
        ],
      ),
    );
  }
}

Widget displayDessert() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
        //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    height: 510,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var dessertFoodItem in desfoodItemList
          .dessertFoodItems) //loop through every breakfast items present in the list
        DessertItemContainer(
            dessertFoodItem:
                dessertFoodItem) //passing breakfast to the container
    ]),
  );
}

class DessertItemContainer extends StatelessWidget {
  // const breakfastItemContainer({Key key}) : super(key: key);

  final DessertFoodItem dessertFoodItem;

  DessertItemContainer({@required this.dessertFoodItem});

  final DessertCartListBloc desbloc =
      BlocProvider.getBloc<DessertCartListBloc>();

  addToCart(DessertFoodItem dessertFoodItem) {
    desbloc.addToList(dessertFoodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(dessertFoodItem);

        //snackar gives a message with an optional action which briefly displays at the bottom of the screen
        final snackbar = SnackBar(
          content: Text("${dessertFoodItem.desname} added to your food cart."),
          duration: Duration(milliseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
      },

      
      child: DessertItems(
        desDescription: dessertFoodItem.desdescription,
        desName: dessertFoodItem.desname,
        desImage: dessertFoodItem.desimage,
        desPrice: dessertFoodItem.desprice,
      ),
    );
  }

  void dispose() {
    desbloc.dispose();
  }
}

class DessertItems extends StatelessWidget {
  //const breakfastItems({Key key}) : super(key: key);

  DessertItems({
    @required this.desImage,
    @required this.desName,
    @required this.desPrice,
    @required this.desDescription,
  });

  final String desDescription;
  final String desName;
  final String desImage;
  final int desPrice;

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
                desName,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              ListTile(
                title: Text(
                  desDescription,
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  "\Rs$desPrice",
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: Image.asset(desImage, fit: BoxFit.cover),
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
