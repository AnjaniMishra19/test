import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sahash/screen/dashboard.dart';
import 'package:sahash/screen/drawer.dart';

// ignore: must_be_immutable
class DashboardContoller extends StatefulWidget {
  int selectedId;
  DashboardContoller({Key key, this.selectedId}) : super(key: key);

  @override
  State<DashboardContoller> createState() => _DashboardContollerState();
}

class _DashboardContollerState extends State<DashboardContoller> {
  final drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: drawerController,
        menuScreen: const MyDrawer(),
        mainScreen: Dashboard(
          selectedId: widget.selectedId,
          zoomdashboardContoller: drawerController,
        ),
        borderRadius: 28.0,
        showShadow: true,
        angle: 0.0,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeOut,
      ),
    );
  }
}
