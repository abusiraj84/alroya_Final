import 'package:alroya/Animations/fadeanimation.dart';
import 'package:alroya/Screens/tabbar.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Screens/SplashScreen.dart';
import 'Tools/globals.dart' as g;
import 'package:firebase_messaging/firebase_messaging.dart';

// import 'Screens/SplashScreen.dart'; //

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  // void setupNotifacation() async {
  //   _firebaseMessaging.getToken().then((token) {
  //     print(token);
  //   });

  //   _firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       print("Message: $message");
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       print("Message: $message");
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print("Message: $message");
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        navigatorObservers: [BotToastNavigatorObserver()],
        darkTheme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
            brightness: Brightness.light,
            fontFamily: "SST-Arabic-Medium",
            primaryColor: g.dark,
            accentColor: g.dark),
        theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
            brightness: Brightness.light,
            fontFamily: "SST-Arabic-Medium",
            primaryColor: g.dark,
            accentColor: g.dark),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar'), // arabic
        ],
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),
        routes: {
          '/': (ctx) => SplashScreen(),
          "/MyTabBar": (ctx) => MyTabBar(),
        },
        // home: FadeAnimation(0.5, MyTabBar()),
      ),
    );
  }
}
