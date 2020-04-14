import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/Regular/regularItems.dart';
import 'cartListBloc.dart';
import 'listTileColorBloc.dart';

class FoodCart extends StatelessWidget {
  const FoodCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

    List<RegularItems> ritems;
    return StreamBuilder(
      //streambuilder to change UI reactively without needing to call setState()
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          ritems = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.add_shopping_cart),
              backgroundColor: Colors.brown,
              title: Text('Food Cart'),
              centerTitle: true,
            ),
            body: SafeArea(
              child: CartBody(ritems),
            ),
            bottomNavigationBar: BottomBar(ritems),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<RegularItems> ritems;

  BottomBar(this.ritems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(ritems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          PlaceOrder(),
        ],
      ),
    );
  }
}
//   void orderNum() {
//   var random = new Random();
//   // Printing Random Number between 1 to 10000 on Terminal Window.
//   print(random.nextInt(10000));
// }

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
      child: RaisedButton(
        color: Colors.grey[400],
        elevation: 18,
        onPressed: () {
          //orderNum();
          final snackBar = SnackBar(
            content: Text('Your order has been placed.'),
            duration: Duration(milliseconds: 2500),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },
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
    ));
  }
}

Container totalAmount(List<RegularItems> ritems) {
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
          "\Rs.${returnTotalAmount(ritems)}",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
        ),
      ],
    ),
  );
}

String returnTotalAmount(List<RegularItems> ritems) {
  double totalAmount = 0.0;

  for (int i = 0; i < ritems.length; i++) {
    totalAmount = totalAmount + ritems[i].price * ritems[i].quantity;
  }
  return totalAmount.toStringAsFixed(2);
}

class CartBody extends StatelessWidget {
  final List<RegularItems> ritems;

  CartBody(this.ritems);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [Bloc((i) => CartListBloc())],
        child: Column(
          children: <Widget>[
            CustomBar(),
            Expanded(
              flex: 1,
              child: ritems.length > 0 ? foodItemList() : noItemContainer(),
            )
          ],
        ));
  }
  

  Container noItemContainer() {
    return Container(
        child: Center(
            child: Text(
      "No food item in the cart.",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontStyle: FontStyle.italic,
        fontFamily: 'Rancho-Regular',
      ),
    )));
  }

  ListView foodItemList() {
    return ListView.builder(
      itemCount: ritems.length,
      itemBuilder: (context, index) {
        return CartListItem(ritem: ritems[index]);
      },
    );
  }
}


class CartListItem extends StatelessWidget {
  final RegularItems ritem;

  CartListItem({@required this.ritem});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      hapticFeedbackOnStart: false,
      maxSimultaneousDrags: 1,
      data: ritem,
      feedback: DraggableChildFeedback(ritem: ritem),
      child: DraggableChild(ritem: ritem),
      childWhenDragging:
          ritem.quantity > 1 ? DraggableChild(ritem: ritem) : Container(),
    );
  }
}

class DraggableChild extends StatelessWidget {
  const DraggableChild({
    Key key,
    @required this.ritem,
  }) : super(key: key);

  final RegularItems ritem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(
        ritem: ritem,
      ),
    );
  }
}

class DraggableChildFeedback extends StatelessWidget {
  const DraggableChildFeedback({
    Key key,
    @required this.ritem,
  }) : super(key: key);

  final RegularItems ritem;

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
              child: ItemContent(ritem: ritem),
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
    @required this.ritem,
  }) : super(key: key);

  final RegularItems ritem;

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
                    color: Colors.brown,
                    fontFamily: 'Rancho-regular',
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(text: ritem.quantity.toString()),
                  TextSpan(text: " x ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: ritem.name,
                  ),
                ]),
          ),
          Text(
            "\Rs.${ritem.quantity * ritem.price}",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 23,fontFamily: 'Rancho-regular',),
          ),
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

    return BlocProvider(
        blocs: [
          Bloc((i) => CartListBloc()),
          Bloc((i) => ColorBloc()),
        ],
        child:Row(
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
                  fontFamily: 'Lobster-Regular'
                ),
              ),
              Text(
                "        Order                                   ",
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w300,
                  fontSize: 30,
                  fontFamily: 'Lobster-Regular'
                ),
              ),
              SizedBox(height: 20),
            ],
            
          ),
              DragTargetWidget(bloc),
              
          ],
        ),
          
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
    RegularItems currentFoodItem;
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

    return BlocProvider(
        blocs: [Bloc((i) => ColorBloc())],
        child: DragTarget<RegularItems>(
          onAccept: (RegularItems ritem) {
            currentFoodItem = ritem;
            colorBloc.setColor(Colors.white);
            widget.bloc.removeFromList(currentFoodItem);
          },
          onWillAccept: (RegularItems ritem) {
            colorBloc.setColor(Colors.red);
            return true;
          },
          // onLeave: (RegularItems ritem) {
          //   colorBloc.setColor(Colors.white);
          // },

          builder: (BuildContext context, List incoming, List rejected) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                CupertinoIcons.delete,
                size: 35,
              ),
            );
          },
        ));
  }
}
