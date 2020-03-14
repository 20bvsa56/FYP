import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:menu_app/MenuGroup/menuCategory.dart';
import 'package:menu_app/bloc/BurgerBloc/burgerCartListBloc.dart';
import 'package:menu_app/cart/burgerFoodItem.dart';


class BurgerItem extends StatelessWidget {
  const BurgerItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => BurgerCartListBloc())],
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
        title: Text('Burger Items'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          displayBurger(),
        ],
      ),
    );
  }
}

Widget displayBurger() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: new BoxDecoration(
        //new Color.fromRGBO(255, 0, 0, 0.0),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    height: 510,
    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      for (var burgerFoodItem in burfoodItemList
          .burgerFoodItems) //loop through every breakfast items present in the list
        BurgerItemContainer(
            burgerFoodItem:
                burgerFoodItem) //passing breakfast to the container
    ]),
  );
}

class BurgerItemContainer extends StatelessWidget {
  // const breakfastItemContainer({Key key}) : super(key: key);

  final BurgerFoodItem burgerFoodItem;

  BurgerItemContainer({@required this.burgerFoodItem});

  final BurgerCartListBloc burbloc =
      BlocProvider.getBloc<BurgerCartListBloc>();

  addToCart(BurgerFoodItem burgerFoodItem) {
    burbloc.addToList(burgerFoodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(burgerFoodItem);

        //snackar gives a message with an optional action which briefly displays at the bottom of the screen
        final snackbar = SnackBar(
          content: Text("${burgerFoodItem.burname} added to your food cart."),
          duration: Duration(milliseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar); //showing the snackbar
      },

      
      child: BurgerItems(
        burDescription: burgerFoodItem.burdescription,
        burName: burgerFoodItem.burname,
        burImage: burgerFoodItem.burimage,
        burPrice: burgerFoodItem.burprice,
      ),
    );
  }

  void dispose() {
    burbloc.dispose();
  }
}

class BurgerItems extends StatelessWidget {
  //const breakfastItems({Key key}) : super(key: key);

  BurgerItems({
    @required this.burImage,
    @required this.burName,
    @required this.burPrice,
    @required this.burDescription,
  });

  final String burDescription;
  final String burName;
  final String burImage;
  final int burPrice;

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
                burName,
                style: TextStyle(
                  fontFamily: 'Rancho-Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              ListTile(
                title: Text(
                  burDescription,
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  "\Rs$burPrice",
                  style: TextStyle(
                    fontFamily: 'Rancho-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                trailing: Image.asset(burImage, fit: BoxFit.cover),
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