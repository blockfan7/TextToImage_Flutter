import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:text2image/constants/common_colors.dart';
import 'package:text2image/view_models/splash_view_model.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: purpleColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/images/logo.png',
          height: animation.value + 50,
          width: animation.value + 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 200, end: 210).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  requestPermissions() async {
    // if (!await Permission.unknown.status.isGranted) {
    //   await Permission.unknown.request();
    // }
    // if (!await Permission.locationAlways.status.isGranted) {
    //   await Permission.locationAlways.request();
    // }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, model, child) => buildWidget(context, model, child),
      onModelReady: (model) => model.initialize(),
    );
  }

  buildWidget(BuildContext context, SplashViewModel model, Widget child) {
    return Container(
      color: purpleColor,
      child: Stack(
        children: <Widget>[
          AnimatedLogo(
            animation: animation,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 50),
            child: Text(
              "Text to Picture - 1.0",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 80),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
