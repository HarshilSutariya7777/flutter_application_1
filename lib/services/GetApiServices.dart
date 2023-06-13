import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/WallpaperModel.dart';

import 'package:http/http.dart' as http;

const String apikey =
    "JkNiIfhEw3va5sHuBmdB5Dvzz2oIrpUgvewKh83k9i8eBYsKh4Ki2Uem";

class GetApiSevices {
  static var client = http.Client();
  static Future fetchdata() async {
    var response = await client.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=&page=1"),
        headers: {"Authorization": apikey});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      debugPrint("json String :$jsonString");
      return wallpaperModelFromJson(jsonString);
    }
  }
}
