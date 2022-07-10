import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String name;
  Color color;
  Function press;
  CustomButton({Key key, this.name, this.color, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        child: Text(name),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            primary: color,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 13),
            textStyle: const TextStyle(
              fontSize: 17,
            )),
        onPressed: () {
          press();
        },
      ),
    );
  }
}
