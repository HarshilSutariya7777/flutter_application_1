import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Fullscreen extends StatefulWidget {
  final String img;
  final String name;
  const Fullscreen({super.key, required this.img, required this.name});

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CircleAvatar(
        radius: 50,
      ),
    );
  }
}
