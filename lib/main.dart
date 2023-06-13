import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ApiScreen/locator.dart';
import 'package:flutter_application_1/apicalled.dart';
import 'package:flutter_application_1/const.dart';
import 'package:flutter_application_1/contents/text.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAPi(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            overflowSpacing: size.height * 0.014,
            children: [
              Column(
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
                    AppText().req,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: kButtonColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.024),
                  TextField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: kInputColor),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintText: AppText().email,
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: SvgPicture.asset(userIcon)),
                        fillColor: kWhiteColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(37),
                        )),
                  ),
                  SizedBox(height: size.height * 0.015),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: kInputColor),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintText: AppText().pass,
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: SvgPicture.asset(keyIcon)),
                        fillColor: kWhiteColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(37),
                        )),
                  ),
                  SizedBox(height: size.height * 0.020),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.080,
                      decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(37),
                      ),
                      child: Text(
                        AppText().con,
                        style: const TextStyle(
                            color: kWhiteColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.050),
                  const Text("__________________or___________________"),
                  SizedBox(height: size.height * 0.050),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.080,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 45,
                              spreadRadius: 0,
                              offset: Offset(0, 25),
                              color: Color.fromRGBO(120, 37, 139, 0.25)),
                        ],
                        color: const Color.fromRGBO(225, 225, 225, 0.28),
                        borderRadius: BorderRadius.circular(37),
                      ),
                      child: Text(
                        AppText().acc,
                        style: const TextStyle(
                            color: kWhiteColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
