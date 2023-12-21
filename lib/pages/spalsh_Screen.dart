import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemate/pages/phone_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn);

    _animationController.forward();

    // Set up a timer to navigate to the next screen after 2 seconds (adjust the duration as needed)
    Timer(Duration(seconds: 4), () {
      // Replace 'NextScreen()' with the screen you want to navigate to
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => phonenoscreen()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: const Color(0x000000FF),
      body: Center(
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
           
          ),
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset('assets/app_logo.png'),
          ),
        ),
      ),
    );
  }
}


