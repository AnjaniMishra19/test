import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Common {
  static Flushbar success(context, title, message) {
    return Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.green,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
    )..show(context);
  }

  static Flushbar error(context, title, message) {
    return Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.red,
      boxShadows: const [
        BoxShadow(
          color: Colors.red,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 5),
    )..show(context);
  }
}
