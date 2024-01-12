import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/category/1_gridv.dart';
import 'package:moviemate/category/tranding.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:moviemate/pages/naviagation_bar.dart';
import 'package:moviemate/pages/ratinf-set.dart';
import 'package:moviemate/pages/registration.dart';
import 'package:moviemate/pages/seat_selection.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/discription.dart';
import 'package:moviemate/pages/spalsh_Screen.dart';
import 'package:moviemate/pages/theater.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return MaterialApp(
    home:  Disc(),
  );
  }
}
