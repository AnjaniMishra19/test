import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAttendence extends StatelessWidget {
  Color bordercolor;
  Color boxcolor;
  String attendenceno;
  String attendencedata;
  CustomAttendence(
      {Key key,
      this.bordercolor,
      this.boxcolor,
      this.attendenceno,
      this.attendencedata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
            color: bordercolor,
          )),
          color: boxcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(attendenceno),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(attendencedata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
