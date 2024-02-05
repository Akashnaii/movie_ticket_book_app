import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/Terms_Condition.dart';

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
      home: termsandcondition(),
    );
  }
}
