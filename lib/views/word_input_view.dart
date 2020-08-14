import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:text2image/constants/common_colors.dart';
import 'package:text2image/view_models/word_input_view_model.dart';

class WordInputView extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  FocusNode textFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WordInputViewModel>.reactive(
      builder: (context, model, child) => buildWidget(context, model, child),
      viewModelBuilder: () => WordInputViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }

  buildWidget(BuildContext context, WordInputViewModel model, Widget child) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: buildAppBar(context, model),
      body: buildBody(context, model),
    );
  }

  buildAppBar(BuildContext context, WordInputViewModel model) {}

  buildBody(BuildContext context, WordInputViewModel model) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: height / 7 * 2,
              child: buildLogo(context, model),
            ),
            Container(
              height: height / 7 * 3,
              child: buildWordContainer(context, model),
            ),
            Container(
              height: height / 7 * 2,
              child: buildBottom(context, model),
            )
          ],
        ),
      ),
    );
  }

  buildLogo(BuildContext context, WordInputViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  buildWordContainer(BuildContext context, WordInputViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(width: 1, color: blackColor),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black,
              offset: Offset(1, -1),
              spreadRadius: 1,
            )
          ],
        ),
        child: TextField(
          controller: textController,
          focusNode: textFocus,
          // minLines: 5,
          maxLines: 30,
          style: TextStyle(color: blackColor, fontSize: 20),
          cursorColor: blueColor,
          autofocus: false,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'ADD TEXT HERE',
            hintStyle: TextStyle(color: greyColor, fontSize: 20),
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }

  buildBottom(BuildContext context, WordInputViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RaisedButton(
            color: Color(0xFF03A9F5),
            elevation: 10,
            onPressed: () {
              textFocus.unfocus();
              model.setTextAndNext(textController.text);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text(
                'Convert',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
              side: BorderSide(color: whiteColor),
            ),
          ),
          Container(
            child: Text(
              "Powered by Wuzlla",
              style: TextStyle(color: whiteColor, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
