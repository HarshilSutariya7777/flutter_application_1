import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/WallpaperModel.dart';
import 'package:flutter_application_1/services/GetApiServices.dart';
import 'package:get/get.dart';

class WallpaperController extends GetxController {
  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  var wallpaperList = WallpaperModel().obs;
  void fetchdata() async {
    var product = await GetApiSevices.fetchdata();
    debugPrint('wallpaper product : $product');
    if (product != null) {
      wallpaperList.value = product;
    }
  }
}
