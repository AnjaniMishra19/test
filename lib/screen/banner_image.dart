import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatefulWidget {
  const BannerImage({Key key}) : super(key: key);

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  List<String> imgList = [
    'assets/product.jpg',
    'assets/order.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}
