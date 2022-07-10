import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sahash/localisation/demo_localisation.dart';
import 'package:sahash/networking/connectivity_provider.dart';
import 'package:sahash/routes/custom_route.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:sahash/screen/local_auth.dart';
import 'package:sahash/service/manu_page_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // ignore: avoid_print
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// ignore: must_be_immutable, use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  SharedPreferences sharedPreferences;
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

ManuPageService _manuPageService = ManuPageService();

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // ignore: unused_field
  Locale _locale;
  bool _isFingerPrintEnabled = false;
  bool isLoading = false;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchSettings();
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        // ignore: missing_required_param
        showDialog(
            // context: context,
            builder: (_) {
          return AlertDialog(
            title: Text(notification.title),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(notification.body)],
              ),
            ),
          );
        });
      }
    });
    getToken();
  }

  String token;
  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
  }

  _fetchSettings() async {
    setState(() {
      isLoading = true;
    });
    _isFingerPrintEnabled = await _manuPageService.getAuthentication() ?? false;
    if (_isFingerPrintEnabled == true) {
      await LocalAuth.authenticate();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _manuPageService.getLocale(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Return some error widget
            return Text('Error: ${snapshot.error}');
          } else {
            Locale fetchedLocale = snapshot.data;
            return ChangeNotifierProvider(
                create: (context) => ConnectivityProvider(),
                child: MaterialApp(
                  title: "SahashApp",
                  locale: fetchedLocale,
                  localizationsDelegates: const [
                    CountryLocalizations.delegate,
                    DemoLocalization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale("en", "US"),
                    Locale("zh", "CN"),
                    Locale("es", "ES"),
                    Locale("hi", "IN"),
                    Locale("ar", "DZ"),
                    Locale("ru", "RU"),
                    Locale("ja", "JP"),
                    Locale("de", "DE")
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    if (locale == null) {
                      debugPrint("*language locale is null!!!");
                      return supportedLocales.first;
                    }
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode == locale.languageCode &&
                          supportedLocale.countryCode == locale.countryCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.last;
                  },
                  theme: ThemeData(
                    textTheme: GoogleFonts.ubuntuTextTheme(
                      Theme.of(context).textTheme,
                    ),
                    // primarySwatch: Colors.red,
                    // scaffoldBackgroundColor: Colors.red,
                  ),
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: CustomRoute.allRoutes,
                  initialRoute: RouteName.splashScreen,
                ));
          }
        });
  }
}
