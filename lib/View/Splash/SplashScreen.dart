import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utility/ColorTheme.dart';
import '../Login/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Login(
                  mobile: '',
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 266,
                    width: 261,
                    margin: const EdgeInsets.only(
                        left: 77, right: 76, top: 237, bottom: 297),
                    child: Image.asset("assets/images/splash/yopee_logo.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 470, bottom: 210),
                    height: 5,
                    width: 49,
                    color: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 535, bottom: 200),
                    height: 49,
                    child: const Text(
                      "Car Cleaner",
                      style: TextStyle(
                          fontFamily: "Medium",
                          fontSize: 20,
                          color: ColorTheme.themeWhiteColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
