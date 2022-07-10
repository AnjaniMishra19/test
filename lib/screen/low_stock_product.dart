import 'package:flutter/material.dart';

class LowStockProduct extends StatelessWidget {
  const LowStockProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Low Stock Product"),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
              icon: Image.asset('assets/icon_arrow_back.png'),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: Container(),
    );
  }
}
