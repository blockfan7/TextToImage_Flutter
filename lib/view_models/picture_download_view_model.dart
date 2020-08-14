import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:text2image/view_models/base_model.dart';

class PictureDownloadViewModel extends BaseModel {
  int backgroundColor = 0xFFFFFFFF;
  double devicePixelRatio = 3.0;

  initialize() {}

  void changeBackgroundColor(int color) {
    backgroundColor = color;
    notifyListeners();
  }
}
