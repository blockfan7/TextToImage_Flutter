import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:text2image/constants/common_colors.dart';
import 'package:text2image/view_models/picture_download_view_model.dart';
import 'package:text2image/widgets/progress_widget.dart';

class PictureDownloadView extends StatelessWidget {
  final String text;
  final GlobalKey boundaryKey = GlobalKey();
  PictureDownloadView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PictureDownloadViewModel>.reactive(
      builder: (context, model, child) => buildWidget(context, model, child),
      viewModelBuilder: () => PictureDownloadViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }

  buildWidget(
      BuildContext context, PictureDownloadViewModel model, Widget child) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: buildAppBar(context, model),
      body: buildBody(context, model),
    );
  }

  buildAppBar(BuildContext context, PictureDownloadViewModel model) {}

  buildBody(BuildContext context, PictureDownloadViewModel model) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: height / 10 * 2,
              child: buildLogo(context, model),
            ),
            Container(
              height: height / 10 * 5,
              child: buildWordContainer(context, model),
            ),
            Container(
              height: height / 10 * 1,
              child: buildColorPicker(context, model),
            ),
            Container(
              height: height / 10 * 2,
              child: buildBottom(context, model),
            )
          ],
        ),
      ),
    );
  }

  buildLogo(BuildContext context, PictureDownloadViewModel model) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Download Your Pic Now",
        style: TextStyle(
          color: whiteColor,
          fontSize: 30,
        ),
      ),
    );
  }

  buildWordContainer(BuildContext context, PictureDownloadViewModel model) {
    return RepaintBoundary(
      key: boundaryKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(width: 1, color: blackColor),
            color: Color(model.backgroundColor),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 2,
            //     color: Colors.black,
            //     offset: Offset(1, -1),
            //     spreadRadius: 1,
            //   )
            // ],
          ),
          child: Text(
            text,
            style: TextStyle(color: blackColor, fontSize: 20),
          ),
        ),
      ),
    );
  }

  buildColorPicker(BuildContext context, PictureDownloadViewModel model) {
    final List<int> colorList = [
      0xFFFFFFFF,
      0xFFFFF79A,
      0xFF82CA9C,
      0xFF7E00FF,
      0xFFFF0000,
      0xFF00FF00,
      0xFF0000FF,
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: colorList
            .map((color) => buildOneColor(context, model, color))
            .toList(),
      ),
    );
  }

  Widget buildOneColor(
      BuildContext context, PictureDownloadViewModel model, int color) {
    return Container(
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          model.changeBackgroundColor(color);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(
                width: model.backgroundColor == color ? 2 : 0,
                color: whiteColor),
            boxShadow: model.backgroundColor == color
                ? [
                    BoxShadow(
                      blurRadius: 3,
                      color: blackColor,
                      offset: Offset(1, 1),
                    )
                  ]
                : null,
          ),
        ),
      ),
    );
  }

  buildBottom(BuildContext context, PictureDownloadViewModel model) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        color: Color(0xFF03A9F5),
        elevation: 10,
        onPressed: model.busy == true
            ? null
            : () {
                model.exportToimage(boundaryKey);
              },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: model.busy == true
              ? circularProgress()
              : Text(
                  'Save on Phone',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
          side: BorderSide(color: whiteColor),
        ),
      ),
    );
  }
}
