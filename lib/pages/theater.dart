import 'package:flutter/material.dart';

class theater extends StatefulWidget {
  const theater({super.key});

  @override
  State<theater> createState() => _theaterState();
}

class _theaterState extends State<theater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget(
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
