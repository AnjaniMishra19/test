import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerImage extends StatefulWidget {
  List<String> imgList;
  BannerImage({Key key, this.imgList}) : super(key: key);

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.imgList
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
