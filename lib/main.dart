import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/Navigationbar//Terms_Condition.dart';
import 'package:moviemate/pages/booking_history.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:moviemate/pages/registration.dart';
import 'package:moviemate/pages/spalsh_Screen.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/theater.dart';
import 'Navigationbar/Settingscreen.dart';
import 'pages/fetchuser.dart';



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
    return  MaterialApp(
      home: Theater(movieName: 'name', imageUrl: 'image_url'),
    );
  }
}
