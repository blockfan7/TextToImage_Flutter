import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:text2image/constants/common_colors.dart';
import 'package:text2image/view_models/overview_widget_model.dart';

class OverViewWidget extends StatelessWidget {
  final String text;
  final int backColor;
  OverViewWidget({Key key, this.text, this.backColor}) : super(key: key);
  final GlobalKey boundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OverviewWidgetModel>.reactive(
      builder: (context, model, child) => buildWidget(context, model, child),
      viewModelBuilder: () => OverviewWidgetModel(),
      onModelReady: (model) => model.initialize(boundaryKey),
    );
  }

  buildWidget(BuildContext context, OverviewWidgetModel model, Widget child) {
    return Scaffold(
      backgroundColor: transparentColor,
      body: SafeArea(
        child: Center(
          child: RepaintBoundary(
            key: boundaryKey,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(width: 1, color: blackColor),
                color: Color(backColor),
              ),
              child: AutoSizeText(
                text,
                style: TextStyle(color: blackColor, fontSize: 20),
                // maxLines: 1000,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
