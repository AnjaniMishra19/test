import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final double defaultWidth;
  final double defaultHeight;
  const SearchBar({Key key, this.defaultWidth, this.defaultHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7, right: 10),
      height: defaultHeight,
      width: defaultWidth,
      decoration: BoxDecoration(
          border: Border.all(width: 0.60, color: Colors.white),
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30)),
      child: Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          alignment: Alignment.bottomLeft,
          child: Row(children: const [
            Icon(
              Icons.search,
              color: Colors.black45,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Search",
                  style: TextStyle(color: Color.fromARGB(255, 50, 50, 50)),
                ))
          ])),
    );
  }
}
