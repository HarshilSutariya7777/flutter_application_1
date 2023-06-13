import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiScreen/ApiService.dart';
import 'package:flutter_application_1/ApiScreen/Base_model.dart';
import 'package:flutter_application_1/ApiScreen/locator.dart';
import 'package:flutter_application_1/fullscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostApiViewModel extends BaseModel {
  final ApiService apiServices = locator<ApiService>();
  ViewState? viewState;
  postApiVieWModel(
      String email, name, gender, status, BuildContext context) async {
    setState(ViewState.LOADING);
    Map<String, dynamic> params = {
      'email': email,
      'name': name,
      'gender': gender,
      'status': status,
    };
    var postResponse = await apiServices.post(params);
    if (postResponse != null) {
      setState(ViewState.COMPLETED);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext) => const Fullscreen(img: "", name: ""),
        ),
      );
    } else {
      setState(ViewState.COMPLETED);
      Fluttertoast.showToast(msg: "Login Failed");
    }
  }
}
