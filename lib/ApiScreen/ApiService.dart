import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiScreen/post_api_model.dart';
import 'package:http/http.dart' as http;

const String postUrl = "https://gorest.co.in/public/v2/users";

class ApiService {
  Future<PostApi?> post(Map<String, dynamic> data) async {
    Uri uri = Uri.parse(postUrl);

    Map<String, String> header = {
      'authorization':
          'Bearer c76a98c9fe3d853e96e9853c790d2f019ad3a13ad094228ebb8481cd26b3350a'
    };

    var response = await http.post(uri, body: data, headers: header);
    debugPrint("Response: ${response.body}");
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
      Map<String, dynamic> response = jsonResponse;
      PostApi responseModel = PostApi.fromJson(response);
      return responseModel;
    } else {
      debugPrint('error : ${jsonResponse['message']}');
    }
    return null;
  }
}
