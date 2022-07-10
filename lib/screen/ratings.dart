import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Ratings",
          style: TextStyle(color: Colors.black),
        ),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Image.asset(
              'assets/icon_arrow_back.png',
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.blue,
                  Colors.yellow,
                  Colors.green,
                  Colors.white,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.8,
                  1,
                ])),
      ),
    );
  }
}
