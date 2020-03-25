import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'images.dart';
import 'imageCarousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerImage extends StatefulWidget {
  @override
  _BannerImageState createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  List<Images> images = [];

  Future<List<Images>> bannerImages() async {
    var data = await http.get("http://192.168.254.2:8000/api/banner_image/");
    var jsonData = json.decode(data.body);

    //looping thorugh json data and getting details, adding in constructor and then list
    for (var imgval in jsonData) {
      Images imgs = Images(imgval['image']);
      images.add(imgs);
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: bannerImages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.brown[100],
                    ),
                    height: 150,
                    width: 400,
                    // height: MediaQuery.of(context).size.height,
                    child: CarouselSlider.builder(
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlay: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ImageCarousel(
                            snapshot.data[index].image,
                          );
                        }),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
