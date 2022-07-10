import 'package:sahash/customWidgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../localisation/localisation_constant.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'forget')),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Image.asset('assets/icon_arrow_back.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: CustomButton(
          name: "Order",
          color: Colors.blueAccent,
          press: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => OrderPage()));
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: CustomButton(
        name: "Order",
        color: Colors.blueAccent,
        press: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => OrderPage()));
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: avoid_print
    print('Timer Stopped');
  }
}
