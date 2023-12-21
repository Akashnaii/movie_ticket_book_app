import 'package:flutter/material.dart';

class grrid_3 extends StatefulWidget {
  const grrid_3({super.key});

  @override
  State<grrid_3> createState() => _grrid_3State();
}

class _grrid_3State extends State<grrid_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Text(
              'the south Movie',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
