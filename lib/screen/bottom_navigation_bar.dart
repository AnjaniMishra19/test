import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sahash/screen/balance.dart';
import 'package:sahash/screen/customer.dart';
import 'package:sahash/screen/home_page.dart';
import 'package:sahash/screen/setting_page.dart';

// ignore: must_be_immutable
class BottomNavigationBarPage extends StatefulWidget {
  int selectedId;
  BottomNavigationBarPage({Key key, this.selectedId}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int selectedPos = 0;
  List<Widget> tabs;
  @override
  void initState() {
    super.initState();
    tabs = [
      HomePage(selectedId: widget.selectedId),
      const CustomerScreen(),
      const BalanceInformation(),
      SettingPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        disableDefaultTabController: true,
        activeColor: const Color.fromARGB(255, 240, 239, 239),
        height: 60,
        color: const Color.fromARGB(255, 80, 79, 79),
        items: [
          TabItem(
              title: "Home",
              icon: Icon(
                Icons.home_outlined,
                color: selectedPos == 0
                    ? Colors.black
                    : const Color.fromARGB(255, 80, 79, 79),
              )),
          TabItem(
              title: "Category",
              icon: Icon(
                Icons.category_outlined,
                color: selectedPos == 1
                    ? Colors.black
                    : const Color.fromARGB(255, 80, 79, 79),
              )),
          TabItem(
              title: "Collection",
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: selectedPos == 2
                    ? Colors.black
                    : const Color.fromARGB(255, 80, 79, 79),
              )),
          TabItem(
              title: "Settings",
              icon: Icon(
                Icons.settings_outlined,
                color: selectedPos == 3
                    ? Colors.black
                    : const Color.fromARGB(255, 80, 79, 79),
              )),
        ],
        initialActiveIndex: selectedPos,
        backgroundColor: Colors.white,
        elevation: 4,
        onTap: (int index) {
          setState(() {
            selectedPos = index;
          });
        },
      ),
      body: tabs[selectedPos],
    );
  }
}
