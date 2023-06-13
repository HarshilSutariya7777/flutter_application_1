import 'package:flutter_application_1/model/ApiModel.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Placeholder>?> fetchdata() async {
    var response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // print(jsonString);
      return placeholderFromJson(jsonString);
    } else {
      return null;
    }
  }
}
