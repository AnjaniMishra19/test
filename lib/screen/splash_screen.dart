import 'dart:async';
import 'package:sahash/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String isLogin = '_islogin';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> getPrefrenceBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

//==============================================================================
//============================= Build Method ===================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            //decoration: back(),
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                height: 120,
                width: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    bool isFirstTime = await getPrefrenceBool(isLogin);

    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, RouteName.dashboard,
          arguments: 0);
    } else {
      Navigator.pushReplacementNamed(context, RouteName.loginPage);
    }
  }
}
