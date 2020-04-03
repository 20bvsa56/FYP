import 'package:flutter/material.dart';
import 'package:menu_app/Specials/items.dart';
import 'package:menu_app/Specials/specialCartListBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';


class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final SpecialCartListBloc bloc = BlocProvider.getBloc<SpecialCartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<Items> items;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          items = snapshot.data;
          return Scaffold(
            body: SafeArea(child: Container(child: CartBody(items))
          
            ),
            bottomNavigationBar: BottomBar(items) ,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class BottomBar extends StatelessWidget {

  final List<Items> items;

  BottomBar(this.items);

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(items),
          Divider(
            height: 1,
            
            color: Colors.grey[700],
          ),
          persons(),
          nextButtonBar(),
        ],
      ),
    );
  }
}
 Container nextButtonBar() {
    return Container(
    
   
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: RaisedButton(
                                        color: Colors.grey[200],
                                        elevation: 15,
                                        onPressed: () {
                                          // Navigate to the main login screen using a named route '/login'.
                                          // Navigator.pushNamed(context, '/login');
                                        },
                                        child: Text('Place Order',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 25,
                                              fontFamily: 'Rancho-Regular',
                                            )),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(6),
                                          side: BorderSide(color: Colors.black),
                                        ),
                                      ),
      )
    );
  
}

Container persons() {
    return Container(
      // margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Persons",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.brown,
                // fontFamily: 'Rancho-Regular'
              )),
          CustomPersonWidget(),
        ],
      ),
    );
  }

class CustomPersonWidget extends StatefulWidget {
  @override
  _CustomPersonWidgetState createState() => _CustomPersonWidgetState();
}

class _CustomPersonWidgetState extends State<CustomPersonWidget> {
  int noOfPersons = 1;

  double _buttonWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300], width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  if (noOfPersons > 1) {
                    noOfPersons--;
                  }
                });
              },
              child: Text(
                "-",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
          Text(
            noOfPersons.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  noOfPersons++;
                });
              },
              child: Text(
                "+",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Container totalAmount(List<Items> items) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total:",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500,color: Colors.brown),
          ),
          Text(
            "\Rs.${returnTotalAmount(items)}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ],
      ),
    );
  }
    String returnTotalAmount(List<Items> items) {
    double totalAmount = 0.0;

    for (int i = 0; i < items.length; i++) {
      totalAmount = totalAmount + items[i].price * items[i].quantity;
    }
    return totalAmount.toStringAsFixed(2);
  }


class CartBody extends StatelessWidget {
  final List<Items> items;

  const CartBody(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.brown,
        title: Text('Food Cart'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
       title(),
        Expanded(
          flex: 1,
          child: items.length > 0 ? foodItemList(items) : noItemContainer(),
        ),
      ]),
    );
  }
}

Widget title() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Your",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.brown,
                fontFamily: 'Lobster-Regular',
              ),
            ),
            Text(
              "        Order",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic
                  // fontFamily: 'Pacifico-Regular',
                  ),
            ),
          ],
        )
      ],
    ),
  );
}

Container noItemContainer() {
  return Container(
    child: Center(
      child: Text(
        'No food item in the cart.',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontFamily: 'Rancho-Regular',
        ),
      ),
    ),
  );
}

ListView foodItemList(items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (builder, index) {
      return CartListItem(
        item: items[index],
      );
    },
  );
}

class CartListItem extends StatelessWidget {
  final Items item;
  const CartListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ItemContent(item: item),
    );
  }
}

class ItemContent extends StatelessWidget {
  final Items item;
  const ItemContent({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: item.quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rancho-Regular',
                      )),
                  TextSpan(
                      text: " x ",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  TextSpan(
                    text: item.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rancho-Regular',
                    ),
                  ),
                  TextSpan(
                      text: "  =",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rancho-Regular')),
                ]),
              ),
              Text("\Rs.  ${item.quantity * item.price}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rancho-Regular'))
            ],
          ),
        ),
      ),
    );
  }
}
