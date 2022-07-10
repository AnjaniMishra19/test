import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardView extends StatelessWidget {
  int flexno;
  Function press;
  IconData icon;
  Color cardcolor;
  Color cardBordercolor;
  Color iconcolor;
  String name;
  String value;
  CustomCardView(
      {Key key,
      this.flexno,
      this.press,
      this.icon,
      this.cardcolor,
      this.cardBordercolor,
      this.iconcolor,
      this.name,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexno,
        child: InkWell(
            onTap: () {
              press();
            },
            child: Card(
                elevation: 0,
                color: cardcolor,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: cardBordercolor,
                  ))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(children: [
                      Icon(
                        icon,
                        color: iconcolor,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        value,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                  ),
                ))));
  }
}
