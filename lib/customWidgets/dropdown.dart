import 'package:flutter/material.dart';

class DropDownButtonDemo extends StatefulWidget {
  const DropDownButtonDemo({Key key}) : super(key: key);

  @override
  State<DropDownButtonDemo> createState() => _DropDownButtonDemoState();
}

class _DropDownButtonDemoState extends State<DropDownButtonDemo> {
  List<String> staticdropDownItems = ['Lead', 'Customer'];
  String _staticchosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text("Select Data"),
              value: _staticchosenValue,
              iconSize: 36,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              isExpanded: true,
              items: staticdropDownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(value),
                    ));
              }).toList(),
              onChanged: (String value) => setState(() {
                _staticchosenValue = value;
              }),
            ),
          ),
        ),
      ),
    );
  }
}
