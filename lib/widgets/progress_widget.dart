import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.lightBlueAccent,
      ),
    ),
  );
}

myCircularProgress(
    {double size = 20,
    Color color = Colors.lightBlueAccent,
    double width = 2.0}) {
  return Container(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: width,
        valueColor: AlwaysStoppedAnimation(
          color,
        ),
      ),
    ),
  );
}

linearProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.lightBlueAccent,
      ),
    ),
  );
}
