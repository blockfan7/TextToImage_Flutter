import 'package:get_it/get_it.dart';
import 'package:text2image/services/common_data_service.dart';
import 'package:text2image/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CommonDataService());
}
