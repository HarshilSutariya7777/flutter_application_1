import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/const.dart';
import 'package:flutter_application_1/contents/text.dart';
import 'package:flutter_application_1/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [g1, g2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.030),
            child: Column(
              children: [
                Image.asset(imag1),
                Text(
                  AppText().welcome,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kButtonColor.withOpacity(0.7)),
                ),
                Text(
                  AppText().regtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: kButtonColor,
                  ),
                ),
                SizedBox(height: size.height * 0.024),
                TextFormField(
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: kInputColor),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: AppText().name,
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.person)),
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(37))),
                ),
                SizedBox(height: size.height * 0.015),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: kInputColor),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: AppText().phone,
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.phone)),
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(37))),
                ),
                SizedBox(height: size.height * 0.015),
                TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: kInputColor),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: AppText().email,
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.email)),
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(37))),
                ),
                SizedBox(height: size.height * 0.015),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: kInputColor),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: AppText().pass,
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.password)),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined)),
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(37))),
                ),
                SizedBox(height: size.height * 0.020),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.080,
                    decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: Text(
                      AppText().reg,
                      style: const TextStyle(
                          color: kWhiteColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
