import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:text2image/view_models/base_model.dart';

class OverviewWidgetModel extends BaseModel {
  double devicePixelRatio = 3.0;
  Key boundaryKey;
  initialize(Key boundaryKey) async {
    this.boundaryKey = boundaryKey;
    await Future.delayed(const Duration(seconds: 1), () => "3");
    await exportToimage(this.boundaryKey);
    navigationService.pop();
  }

  Future<Uint8List> getImagedata(key) async {
    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    var image = await boundary.toImage(pixelRatio: devicePixelRatio);

    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    return pngBytes;
  }

  Future exportToimage(Key key) async {
    await requestPermission();
    bool permissionCheck = await checkPermission();
    if (permissionCheck == false) {
      setBusy(false);
      BotToast.showText(text: "We can't download because of permission.");
      return;
    }
    setBusy(true);

    var source = await getImagedata(key);
    var path = await _localPath;
    var filename = "${DateTime.now().toUtc().toIso8601String()}.jpg";
    path = path + "/" + filename;

    File(path)..writeAsBytesSync(source);

    BotToast.showText(text: "Successfully downloaded to $path");

    setBusy(false);
  }

  checkPermission() async {
    // if (!await Permission.accessMediaLocation.status.isGranted) {
    //   return false;
    // }

    if (!await Permission.storage.status.isGranted) {
      return false;
    }
    return true;
  }

  requestPermission() async {
    // if (!await Permission.accessMediaLocation.status.isGranted) {
    //   await Permission.accessMediaLocation.request();
    // }
    if (!await Permission.storage.status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<String> get _localPath async {
    if (Platform.isAndroid) {
      return "/sdcard/download";
    } else {
      return (await getApplicationDocumentsDirectory()).path;
    }

    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
  }
}
