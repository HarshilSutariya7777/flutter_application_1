import 'package:flutter_application_1/model/ApiModel.dart';
import 'package:flutter_application_1/services/RemoteSevices.dart';
import 'package:get/get.dart';

class ProuctController extends GetxController {
  // @override
  // void onInit() {
  //   fetchdata();
  //   super.onInit();
  // }

  var productlist = <Placeholder>[].obs;
  void fetchdata() async {
    var product = await RemoteServices.fetchdata();
    if (product != null) {
      productlist.value = product;
    }
  }
}
