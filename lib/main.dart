import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/pages/discription.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/otp_get.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:moviemate/pages/spalsh_Screen.dart';
import 'package:moviemate/pages/theater.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final String verificationId;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Theater(),
    );
  }
}
