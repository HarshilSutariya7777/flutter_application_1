import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class College2 extends StatefulWidget {
  const College2({super.key});

  @override
  State<College2> createState() => _College2State();
}

class _College2State extends State<College2> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ];

  File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       leading: Image.network(imageUrls[index]),
      //       title: Text(items[index]),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return Container(
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: <Widget>[
      //               ListTile(
      //                 leading: Icon(Icons.camera_alt),
      //                 title: Text('Take a photo'),
      //                 onTap: () {
      //                   // TODO: implement photo taking logic
      //                 },
      //               ),
      //               ListTile(
      //                 leading: Icon(Icons.photo),
      //                 title: Text('Choose from gallery'),
      //                 onTap: () {

      //                 },
      //               ),
      //               ListTile(
      //                 leading: Icon(Icons.text_fields),
      //                 title: Text('Add text'),
      //                 onTap: () {
      //                 },
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Column(
        children: [
          Center(
            child: _image == null
                ? const Text('No image selected.')
                : CircleAvatar(
                    radius: 50.0,
                    backgroundImage: FileImage(_image!),
                  ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyListPage(image: _image!)));
              },
              child: const Text("Next"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyListPage extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  final File image;

  MyListPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(image),
            ),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
