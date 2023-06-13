// ignore: prefer_const_constructors_in_immutables

// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/wallpaper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class College extends StatefulWidget {
  final String name;
  final String img;
  // ignore: prefer_const_constructors_in_immutables
  const College(this.name, this.img);

  @override
  State<College> createState() => _CollegeState();
}

class _CollegeState extends State<College> {
  // final WallpaperController wallpaperController =
  //     Get.put(WallpaperController());

  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imagetemp = File(image.path);
    setState(() {
      _image = imagetemp;
    });
  }

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  final TextEditingController _controller = TextEditingController();
  final item = [];

  // List<Product>? alldata;
  // bool isLoading = false;
  // getdata() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Uri uri = Uri.parse("https://api.pexels.com/v1/curated?per_page=&page=1");
  //   var response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body.toString());

  //     debugPrint("response: $json");
  //     setState(() {
  //       alldata =
  //           json["data"].map<Product>((obj) => Product.fromJson(obj)).toList();
  //       // alldata =
  //       //     json["data"].map<Product>((obj) => Product.fromJson(obj)).toList();
  //       debugPrint("alldata:$alldata");
  //       isLoading = false;
  //     });
  //   }
  // }

  List<Wallpaper>? alldata;
  bool isLoading = false;
  String apikey = "JkNiIfhEw3va5sHuBmdB5Dvzz2oIrpUgvewKh83k9i8eBYsKh4Ki2Uem";

  getdata() async {
    setState(() {
      isLoading = true;
    });
    // Uri uri = Uri.parse("https://api.pexels.com/v1/curated?per_page=&page=1,");
    // var response = await http.get(uri);
    var client = http.Client();
    var response = await client.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=&page=1"),
        headers: {"Authorization": apikey});
    print(response);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());

      debugPrint("response: $json");
      setState(() {
        alldata = json["photos"]
            .map<Wallpaper>((obj) => Wallpaper.fromJson(obj))
            .toList();
        // alldata =
        //     json["data"].map<Product>((obj) => Product.fromJson(obj)).toList();
        debugPrint("alldata:$alldata");
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> addDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Add Friends'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      getImage();
                    });
                  },
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null),
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'E.g Meetings and Events',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('cancel'),
              ),
              TextButton(
                onPressed: () {
                  addItem(_controller.text);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          );
        }));
  }

  void addItem(String title) {
    item.insert(0, title);
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void removeItem(int index, BuildContext context) {
    AnimatedList.of(context).removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: Card(
            elevation: 0,
            color: Colors.grey.shade200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: Text(item[index],
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              subtitle: Text(DateTime.now().toString().substring(0, 10),
                  style: const TextStyle(fontSize: 12)),
              trailing: IconButton(
                onPressed: () => removeItem(index, context),
                icon: const Icon(Icons.delete),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar()
        // body: Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: AnimatedList(
        //     key: _key,
        //     initialItemCount: item.length,
        //     itemBuilder: (((context, index, animation) {
        //       return FadeTransition(
        //           opacity: animation,
        //           child: SizeTransition(
        //             key: UniqueKey(),
        //             sizeFactor: animation,
        //             child: Card(
        //               elevation: 0,
        //               color: Colors.grey.shade200,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(16)),
        //               child: ListTile(
        //                 leading:
        //                     CircleAvatar(backgroundImage: FileImage(_image!)),
        //                 title: Text(item[index],
        //                     style: const TextStyle(
        //                         fontSize: 15,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.w500)),
        //                 subtitle: Text(DateTime.now().toString().substring(0, 10),
        //                     style: const TextStyle(fontSize: 12)),
        //                 trailing: IconButton(
        //                   onPressed: () => removeItem(index, context),
        //                   icon: const Icon(Icons.delete),
        //                 ),
        //               ),
        //             ),
        //           ));
        //     })),
        //   ),
        // ),
        // body: Obx(
        //   () => ListView.builder(
        //       itemCount: wallpaperController.wallpaperList.value.photos?.length,
        //       itemBuilder: (context, index) => Pakdding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               height: 100,
        //               color: Colors.white,
        //               child: Row(children: [
        //                 CircleAvatar(
        //                   radius: 50,
        //                   backgroundImage: NetworkImage(wallpaperController
        //                           .wallpaperList
        //                           .value
        //                           .photos?[index]
        //                           .src
        //                           .original ??
        //                       ''),+
        //                 ),
        //                 SizedBox(width: 30),
        //               ]),
        //             ),
        //           )),
        // ),
        );
  }
}
