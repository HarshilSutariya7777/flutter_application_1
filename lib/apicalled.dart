import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/WallpaperModel.dart';
import 'package:http/http.dart' as http;

class MyAPi extends StatefulWidget {
  const MyAPi({super.key});

  @override
  State<MyAPi> createState() => _MyAPiState();
}

class _MyAPiState extends State<MyAPi> {
  List<WallpaperModel> productlist = [];
  WallpaperModel? product;
  bool isLoading = false;
  getdata() async {
    setState(() {
      isLoading = true;
    });
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse("https://api.pexels.com/v1/curated?per_page=&page=1"),
          headers: {
            "Authorization":
                "JkNiIfhEw3va5sHuBmdB5Dvzz2oIrpUgvewKh83k9i8eBYsKh4Ki2Uem"
          });

      // var response = await http.get(url);
      debugPrint("response: $response");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint("responcehold: $data");
        WallpaperModel product1 = WallpaperModel.fromJson(data);
        product = product1;
        setState(() {
          isLoading = false;
        });
      } else {
        debugPrint("error");
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: (isLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: product!.photos!.length,
                itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(product!.photos![index].src.original),
                      ),
                      title: Text(product!.photos![index].id.toString()),
                      subtitle: Text(product!.photos![index].photographer),
                    )));
  }
}
