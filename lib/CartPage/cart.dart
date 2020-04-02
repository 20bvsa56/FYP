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
        }else{
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
      body: Column(
        children: <Widget>[
        Expanded(
        flex: 1,
        child: items.length > 0 ? foodItemList(items) : noItemContainer(),
      ),
        ]
      ),
    );
  }
}

Container noItemContainer(){
  return Container(
    child: Center(
      child: Text('No food item in the cart.'),
    ),
  );
}

ListView foodItemList(items){
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (builder, index){
      return CartListItem(item: items[index]);
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
      child: Container(
        color: Colors.brown[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset(item.image,fit: BoxFit.cover, height: 50, width: 60),
            // ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.blue,
                fontSize:15),
                children: [
                  TextSpan(text: item.quantity.toString(), style:TextStyle(fontSize: 18, color: Colors.white)),
                  TextSpan(text: " x ", style: TextStyle(fontSize: 18, color: Colors.black)),
                  TextSpan(
                    text:item.name, style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  TextSpan(text: "  =", style: TextStyle(fontSize: 18, color: Colors.black)),
                  
                ]
              ),
              
            ),
            Text("\Rs. item.quantity * item.price",
            style: TextStyle(color: Colors.black),)


          ],
        ),
      ),
    );
  }
}
