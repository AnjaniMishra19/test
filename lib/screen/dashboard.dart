import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sahash/customWidgets/search_bar.dart';
import 'package:sahash/screen/bottom_navigation_bar.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  int selectedId;
  // ignore: prefer_typing_uninitialized_variables
  final zoomdashboardContoller;
  Dashboard({Key key, this.selectedId, this.zoomdashboardContoller})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 236, 236),
        appBar: AppBar(
          elevation: 4.0,
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 130, 130, 130),
          ),
          leading: InkWell(
              onTap: () => widget.zoomdashboardContoller.toggle(),
              child: const Icon(
                Icons.notes,
                color: Color.fromARGB(255, 130, 130, 130),
              )),
          backgroundColor: Colors.white,
          actions: [
            InkWell(
              child: SearchBar(
                defaultWidth: MediaQuery.of(context).size.width * .68,
                defaultHeight: MediaQuery.of(context).size.height * .2,
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(children: [
                InkWell(
                  onTap: () {},
                  child: Badge(
                    badgeColor: Colors.redAccent,
                    position: BadgePosition.topEnd(top: -9, end: -9),
                    badgeContent: const Text(
                      "9",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: const Icon(Icons.notifications,
                        color: Color.fromARGB(255, 130, 130, 130)),
                  ),
                ),
              ]),
            ),
          ],
        ),
        body: SafeArea(
            child: BottomNavigationBarPage(selectedId: widget.selectedId)));
  }
}
