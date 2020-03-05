import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
import 'package:menu_app/bloc/PizzaBloc/pizzaCartListBloc.dart';
import 'package:menu_app/cart/pizzaFoodItem.dart';



class PizzaItem extends StatelessWidget {
  const PizzaItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => PizzaCartListBloc())],
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
        title: Text('Pizza Items'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          displayPizza(),
        ],
      ),
    );
  }
}

Widget displayPizza() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
        //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    height: 510,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var pizzaFoodItem in pizfoodItemList
          .pizzaFoodItems) //loop through every breakfast items present in the list
        PizzaItemContainer(
            pizzaFoodItem:
                pizzaFoodItem) //passing breakfast to the container
    ]),
  );
}

class PizzaItemContainer extends StatelessWidget {
  // const breakfastItemContainer({Key key}) : super(key: key);

  final PizzaFoodItem pizzaFoodItem;

  PizzaItemContainer({@required this.pizzaFoodItem});

  final PizzaCartListBloc pizbloc =
      BlocProvider.getBloc<PizzaCartListBloc>();

  addToCart(PizzaFoodItem pizzaFoodItem) {
    pizbloc.addToList(pizzaFoodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(pizzaFoodItem);

        //snackar gives a message with an optional action which briefly displays at the bottom of the screen
        final snackbar = SnackBar(
          content: Text("${pizzaFoodItem.pizname} added to your food cart."),
          duration: Duration(milliseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
      },
      child: LunchItems(
        pizDescription: pizzaFoodItem.pizdescription,
        pizName: pizzaFoodItem.pizname,
        pizImage: pizzaFoodItem.pizimage,
        pizPrice: pizzaFoodItem.pizprice,
      ),
    );
  }

  void dispose() {
    pizbloc.dispose();
  }
}

class LunchItems extends StatelessWidget {
  //const breakfastItems({Key key}) : super(key: key);

  LunchItems({
    @required this.pizImage,
    @required this.pizName,
    @required this.pizPrice,
    @required this.pizDescription,
  });

  final String pizDescription;
  final String pizName;
  final String pizImage;
  final int pizPrice;

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
                pizName,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              ListTile(
                title: Text(
                  pizDescription,
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  "\Rs$pizPrice",
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: Image.asset(pizImage, fit: BoxFit.cover),
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
