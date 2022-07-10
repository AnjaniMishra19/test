import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListSettings extends StatelessWidget {
  dynamic data;
  CustomListSettings({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 5);
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 227, 226, 226),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 7, left: 20, right: 0, bottom: 5),
              trailing: Transform.scale(
                scale: 3,
                child: IconButton(
                  color: Colors.black,
                  icon: Image.asset(
                    'assets/icon_arrow_next.png',
                    color: const Color.fromARGB(255, 74, 74, 74),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, data[index]["url"]);
                  },
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, data[index]["url"]);
                },
                child: Text(data[index]["text"]),
              ),
            ),
          );
        },
      ),
    );
  }
}
