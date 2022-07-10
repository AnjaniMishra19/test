import 'package:sahash/routes/route_name.dart';
import 'package:sahash/screen/local_auth.dart';
import 'package:sahash/service/manu_page_service.dart';
import 'package:flutter/material.dart';
import '../localisation/localisation_constant.dart';

class AuthenticationPageSettings extends StatefulWidget {
  const AuthenticationPageSettings(String page, {Key key}) : super(key: key);

  @override
  State<AuthenticationPageSettings> createState() =>
      _AuthenticationPageSettingsState();
}

class _AuthenticationPageSettingsState
    extends State<AuthenticationPageSettings> {
  bool _isFingerPrintEnabled = false;
  ManuPageService _manuPageService;
  bool isLoading = false;

  _setSetting(value) async {
    if (value == false) {
      await _manuPageService.setAuthentication(value);
    } else if (value == true) {
      final isAuthenticate = await LocalAuth.authenticate();
      if (isAuthenticate) {
        Navigator.pushReplacementNamed(context, RouteName.dashboard);
        await _manuPageService.setAuthentication(isAuthenticate);
      } else {
        Navigator.pushReplacementNamed(context, RouteName.loginPage);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _manuPageService = ManuPageService();
    _fetchSettings();
  }

  _fetchSettings() async {
    setState(() {
      isLoading = true;
    });
    _isFingerPrintEnabled = await _manuPageService.getAuthentication() ?? false;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'auth_settings')),
          leading: Transform.scale(
            scale: 2,
            child: IconButton(
              icon: Image.asset('assets/icon_arrow_back.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ListTile(
                title: Text(getTranslated(context, 'unlock_with_fingerprint')),
                trailing: Switch(
                  value: _isFingerPrintEnabled,
                  onChanged: (value) {
                    _setSetting(value);
                    if (value == true) {
                      setState(() {
                        _isFingerPrintEnabled = true;
                      });
                    } else {
                      setState(() {
                        _isFingerPrintEnabled = false;
                      });
                    }
                  },
                  activeTrackColor: Colors.blueAccent,
                  activeColor: Colors.blueAccent,
                ),
              ),
            )
          ],
        ));
  }
}
