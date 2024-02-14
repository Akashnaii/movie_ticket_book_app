import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/phone_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isUserLoggedIn = false; // Assume the user is not logged in by default

  @override
  void initState() {
    super.initState();

    // Set up a timer to navigate to the next screen after 4 seconds
    Timer(Duration(seconds: 4), () {
      // Check if the user is already logged in
      if (isUserLoggedIn) {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => HomeP()));
      } else {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => PhoneAuth()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: const Color(0x000000FF),
      body: Center(
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset('assets/app_logo.png'),
        ),
      ),
    );
  }
}
