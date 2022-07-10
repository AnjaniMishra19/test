import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  static String localDate(DateTime date, TimeOfDay time) {
    var formattedDate = DateFormat("dd/MM/yyyy").format(date).toString();
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    var dateTime = '$formattedDate || $hour:$minute';
    return dateTime;
  }
}
