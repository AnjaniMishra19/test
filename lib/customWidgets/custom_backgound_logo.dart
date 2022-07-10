import 'package:flutter/material.dart';

class CustomBackgroundLogo extends StatelessWidget {
  const CustomBackgroundLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.2) - 50),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
