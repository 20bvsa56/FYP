import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(2.0),
        height:190.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/pizza.jpg'),
            AssetImage('images/rolls.jpeg'),
            AssetImage('images/burger.jpeg'),
            AssetImage('images/momo.jpeg'),
            AssetImage('images/pasta.jpeg'),
            AssetImage('images/salad.jpeg'),
            AssetImage('images/breakfast.jpeg'),
          ],
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 8000),
        ),
      ),
    );
  }
}
