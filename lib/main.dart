import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/pages/Creditcard.dart';
import 'package:moviemate/pages/seat_selection.dart';
import 'package:moviemate/pages/spalsh_Screen.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/transaction_succes.dart';

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
      home: SplashScreen(),
    );
  }
}
