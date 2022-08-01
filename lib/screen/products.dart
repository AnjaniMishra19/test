import 'dart:io';
import 'package:sahash/customWidgets/custom_button.dart';
import 'package:sahash/customWidgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:sahash/screen/search_view.dart';
import 'package:sahash/screen/search_view2.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  double _currentSliderValue = 0;
  double defaultSilderValue = 1.0;
  File image;

  void sliderValueChangeHandler(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: ListView(
        children: [
          RichText(
              text: const TextSpan(
                  text: 'Hello', style: TextStyle(color: Colors.black))),
          RichText(
              text: const TextSpan(
                  text: 'World', style: TextStyle(color: Colors.black))),
          RichText(
              text: const TextSpan(
                  text: 'Hello', style: TextStyle(color: Colors.black))),
          RichText(
              text: const TextSpan(
                  text: 'Hello',
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(text: 'World'),
                TextSpan(text: 'World!')
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: Transform.scale(
                  scale: 5,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icon_info.png',
                      color: Colors.black,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  "Your waiting time will be reduced through confirmation",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      letterSpacing: 0.25),
                ),
              ),
            ],
          ),
          CustomSlider(
              _currentSliderValue > 0
                  ? _currentSliderValue
                  : defaultSilderValue,
              sliderValueChangeHandler),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomButton(
              name: 'Search',
              color: Colors.blueAccent,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CustomButton(
              name: 'Search 2',
              color: Colors.blueAccent,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView2()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
