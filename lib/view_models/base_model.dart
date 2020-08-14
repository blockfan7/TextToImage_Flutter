import 'package:flutter/material.dart';
import 'package:text2image/services/common_data_service.dart';

import 'package:text2image/services/navigation_service.dart';
import '../locator.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;

  NavigationService navigationService = locator<NavigationService>();
  CommonDataService commonDataService = locator<CommonDataService>();

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
