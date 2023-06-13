// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/ApiScreen/Base_model.dart';
import 'package:flutter_application_1/ApiScreen/post_api_view_model.dart';
import 'package:flutter_application_1/ApiScreen/viewmodel.dart';
import 'package:flutter_application_1/controller/Apicontroller.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  String gender = 'male';
  String isActive = 'Active';
  bool state = true;
  final ProuctController prouctController = Get.put(ProuctController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ViewModelBuilder<PostApiViewModel>(
            onModelReady: (model) => model,
            builder: (context, viewModal, child) =>
                Selector<PostApiViewModel, ViewState>(
                  shouldRebuild: (previous, next) => true,
                  selector: (context, model) => model.state,
                  builder: (context, value, chile) => viewModal.state ==
                          ViewState.LOADING
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(children: [
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            TextFormField(
                              controller: name,
                              decoration: const InputDecoration(
                                hintText: "Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            ListTile(
                              title: Text('Male'),
                              leading: Radio(
                                value: 'male',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text('Female'),
                              leading: Radio(
                                value: 'female',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                CupertinoSwitch(
                                  value: state,
                                  onChanged: (value) {
                                    setState(() {
                                      state = value;
                                      if (state == true) {
                                        isActive = 'Active';
                                      } else {
                                        isActive = 'Inactive';
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (email.text.isEmpty || name.text.isEmpty) {
                                  Fluttertoast.showToast(msg: 'Enter a value');
                                }
                                if (email.text.isNotEmpty ||
                                    name.text.isNotEmpty) {
                                  viewModal.postApiVieWModel(
                                    email.text,
                                    name.text,
                                    gender,
                                    isActive,
                                    context,
                                  );
                                }
                                email.text = '';
                                name.text = '';
                                gender = 'male';
                                state = true;
                              },
                              child: Text('Done'),
                            ),
                          ]),
                        ),
                )));
  }
}
