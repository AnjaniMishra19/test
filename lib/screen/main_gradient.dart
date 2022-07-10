import 'package:flutter/material.dart';

class MainGradient extends StatelessWidget {
  const MainGradient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Gradients",
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text("Linear Gradient"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Container(
              width: 120,
              height: 120,
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
                        1.0,
                      ])),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text("Radial Gradient"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                colors: [
                  Colors.blue,
                  Colors.yellow,
                  Colors.green,
                  Colors.red,
                ],
                radius: 0.75,
                focal: Alignment(0.7, -0.7),
                tileMode: TileMode.clamp,
              )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text("Sweep Gradient"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                  gradient: SweepGradient(
                colors: [
                  Colors.red,
                  Colors.yellow,
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                ],
                stops: <double>[
                  0.0,
                  0.25,
                  0.5,
                  0.75,
                  1.0,
                ],
                tileMode: TileMode.clamp,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
