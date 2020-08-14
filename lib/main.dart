import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:text2image/router.dart';
import 'package:text2image/services/navigation_service.dart';
import 'package:text2image/views/splash_view.dart';

import 'constants/common_colors.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text2Pic',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        // canvasColor: Colors.blue.withOpacity(.8),
        // canvasColor: transparentColor,
        accentColor: whiteColor,
        cursorColor: whiteColor,
        textSelectionHandleColor: Colors.white,
        fontFamily: 'Open Sans',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
          bodyText2: TextStyle(
              fontSize: 14.0, color: Colors.white, fontFamily: "Open Sans"),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColorBrightness: Brightness.dark,
      ),
      home: SplashView(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}
