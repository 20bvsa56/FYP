import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'imageUI.dart';

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
        
        // enlargeCenterPage: true,
        // enableInfiniteScroll: true,
        // autoPlayInterval: Duration(seconds: 5) ,
        // autoPlay: true,
        items: [
          Image.asset("system/public/bannerImage/" + image)
        ],
      ),
    ),
    );
  }
}

// margin: EdgeInsets.all(5.0),
// child: ClipRRect(
//   borderRadius: BorderRadius.all(Radius.circular(3.0)),
//   child: Image.asset("system/public/bannerImage/" + image,
//     fit: BoxFit.cover,
//     )
//   ),
