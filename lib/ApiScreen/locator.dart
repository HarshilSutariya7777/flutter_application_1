import 'package:flutter_application_1/ApiScreen/ApiService.dart';
import 'package:flutter_application_1/ApiScreen/post_api_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerFactory(() => PostApiViewModel());
}
