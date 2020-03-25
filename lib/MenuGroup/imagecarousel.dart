import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ImageCarousel extends StatelessWidget {
  // const ImageCarousel({Key key}) : super(key: key);
  final String image;

  ImageCarousel(this.image);

  @override
  Widget build(BuildContext context) {
    return  Center(
    child:Padding(
      padding: const EdgeInsets.all(6.0),
      child: CarouselSlider(
        items: [
          Image.asset("system/public/bannerImage/" + image)
        ],
      ),
    ),
    );
  }
}

