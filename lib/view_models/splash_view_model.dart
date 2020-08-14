import 'package:text2image/constants/route_names.dart';
import 'package:text2image/view_models/base_model.dart';

class SplashViewModel extends BaseModel {
  initialize() async {
    await Future.delayed(const Duration(seconds: 3), () => "3");
    navigationService.replaceTo(WordInputViewRoute);
  }
}
