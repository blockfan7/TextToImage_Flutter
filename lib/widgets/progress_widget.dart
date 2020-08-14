import 'package:flutter/material.dart';
import 'package:text2image/constants/common_colors.dart';

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
    double width = 2.0,
    String title = ""}) {
  return Container(
    width: 100,
    height: 100,
    color: whiteColor.withOpacity(.8),
    child: Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            strokeWidth: width,
            valueColor: AlwaysStoppedAnimation(
              color,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: color,
          ),
        )
      ],
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
