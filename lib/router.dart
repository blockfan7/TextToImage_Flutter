import 'package:flutter/material.dart';
import 'package:text2image/views/picture_download_view.dart';
import 'package:text2image/views/splash_view.dart';
import 'package:text2image/views/word_input_view.dart';

import 'constants/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashView(),
      );
      break;
    case WordInputViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WordInputView(),
      );
      break;
    case PictureDownloadViewRoute:
      String text = settings.arguments;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PictureDownloadView(text: text),
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  final String strEffect;
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings, this.strEffect})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var begin = Offset(1.0, 0.0);

    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end);
    var curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
