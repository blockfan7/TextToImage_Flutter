import 'package:text2image/constants/route_names.dart';
import 'package:text2image/view_models/base_model.dart';

class WordInputViewModel extends BaseModel {
  String text = "";
  initialize() {}
  void setTextAndNext(String text) {
    this.text = text;
    navigationService.navigateTo(PictureDownloadViewRoute, arguments: text);
  }
}
