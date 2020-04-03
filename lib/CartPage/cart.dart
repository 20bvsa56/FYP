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
            body: SafeArea(child: Container(child: CartBody(items))),
          );
        } else {
          return Container();
        }
      },
    );
  }
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
        Expanded(
          flex: 1,
          child: items.length > 0 ? foodItemList(items) : noItemContainer(),
        ),
      ]),
    );
  }
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
