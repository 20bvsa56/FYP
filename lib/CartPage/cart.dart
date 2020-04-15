import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'cartListBloc.dart';
import 'listTileColorBloc.dart';

class Cart extends StatelessWidget {
  const Cart({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<FoodItem> foodItems;
    return BlocProvider(
        blocs: [Bloc((i) => CartListBloc()), Bloc((i) => ColorBloc())],
        child: StreamBuilder(
          stream: bloc.listStream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              foodItems = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.brown,
                  title: Text('Food Cart'),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: CartBody(foodItems),
                ),
                bottomNavigationBar: BottomBar(foodItems),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(30, 250, 0, 0),
                child: Container(
                    child: Center(
                  child: Column(
                    children: <Widget>[Text('Loading')],
                  ),
                )),
              );
            }
          },
        ));
  }
}

class BottomBar extends StatelessWidget {
  final List<FoodItem> foodItems;

  BottomBar(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(foodItems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          Table(),
          PlaceOrder(),
        ],
      ),
    );
  }

  Container totalAmount(List<FoodItem> foodItems) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Text(
            "\Rs ${returnTotalAmount(foodItems)}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<FoodItem> foodItems) {
    double totalAmount = 0.0;

    for (int i = 0; i < foodItems.length; i++) {
      totalAmount = totalAmount + foodItems[i].price * foodItems[i].quantity;
    }
    return totalAmount.toStringAsFixed(2);
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
      child: Column(
        children: <Widget>[
          CustomBar(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? foodItemList() : noItemContainer(),
          )
        ],
      ),
    );
  }

  Container noItemContainer() {
    return Container(
        child: Center(
            child: Text(
      "No food item in the cart.",
      style: TextStyle(
        color: Colors.black26,
        fontSize: 25,
        fontStyle: FontStyle.italic,
        fontFamily: 'Rancho-Regular',
      ),
    )));
  }

  ListView foodItemList() {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return CartListItem(foodItem: foodItems[index]);
      },
    );
  }
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      hapticFeedbackOnStart: false,
      maxSimultaneousDrags: 1,
      data: foodItem,
      feedback: DraggableChildFeedback(foodItem: foodItem),
      child: DraggableChild(foodItem: foodItem),
      childWhenDragging: foodItem.quantity > 1
          ? DraggableChild(foodItem: foodItem)
          : Container(),
    );
  }
}

class DraggableChild extends StatelessWidget {
  const DraggableChild({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(
        foodItem: foodItem,
      ),
    );
  }
}

class DraggableChildFeedback extends StatelessWidget {
  const DraggableChildFeedback({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return Opacity(
      opacity: 0.7,
      child: Material(
        child: StreamBuilder(
          stream: colorBloc.colorStream,
          builder: (context, snapshot) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: snapshot.data != null ? snapshot.data : Colors.white,
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.95,
              child: ItemContent(foodItem: foodItem),
            );
          },
        ),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  const ItemContent({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Rancho-regular',
                    color: Colors.brown,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(text: foodItem.quantity.toString()),
                  TextSpan(text: " x ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: foodItem.name,
                  ),
                ]),
          ),
          Text("\Rs ${foodItem.quantity * foodItem.price}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rancho-regular',
                  fontSize: 23)),
        ],
      ),
    );
  }
}

class CustomBar extends StatefulWidget {
  @override
  _CustomBarState createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    // final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "  Your",
              style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  fontFamily: 'Lobster-Regular'),
            ),
            Text(
              "        Order                         ",
              style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w300,
                  fontSize: 30,
                  fontFamily: 'Lobster-Regular'),
            ),
          ],
        ),
        DragTargetWidget(bloc),
      ],
    );
  }
}

class DragTargetWidget extends StatefulWidget {
  final CartListBloc bloc;

  DragTargetWidget(this.bloc);

  @override
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  @override
  Widget build(BuildContext context) {
    FoodItem currentFoodItem;
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return DragTarget<FoodItem>(
      onAccept: (FoodItem foodItem) {
        currentFoodItem = foodItem;
        colorBloc.setColor(Colors.white);
        widget.bloc.removeFromList(currentFoodItem);
      },
      onWillAccept: (FoodItem foodItem) {
        colorBloc.setColor(Colors.red);
        return true;
      },
      // onLeave: (FoodItem foodItem) {
      //   colorBloc.setColor(Colors.white);
      //    return true;
      // },
      builder: (BuildContext context, List incoming, List rejected) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            CupertinoIcons.delete,
            size: 40,
            color: Colors.red,
          ),
        );
      },
    );
  }
}

class Table extends StatelessWidget {
  const Table({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tableController = TextEditingController(text: '         Table-1');
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
        child: TextFormField(
          controller: tableController,
          enabled: false,
          style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Rancho-Regular'),
        ),
      ),
    );
  }
}

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    Key key,
  }) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  Future<void> confirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order placement confirmation.',
              style: TextStyle(fontFamily: 'Lobster-regular', fontSize: 22)),
          content: Text('Do you wish to place order?',
              style: TextStyle(fontFamily: 'Lobster-regular')),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text(
                      'Your order has been placed.',
                    ),
                    duration: Duration(milliseconds: 2500),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Text('Yes',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-regular',
                        fontSize: 20))),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster-regular',
                        fontSize: 20))),
          ],
          elevation: 24,
          backgroundColor: Colors.white,
          
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          //shape: CircleBorder(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: RaisedButton(
        color: Colors.grey[400],
        elevation: 18,
        onPressed: confirmation,
        child: Text('Place Order',
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Rancho-Regular',
            )),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15),
          side: BorderSide(color: Colors.brown, width: 2),
        ),
      ),
    );
  }
}
