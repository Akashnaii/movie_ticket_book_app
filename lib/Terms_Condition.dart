import 'package:flutter/material.dart';

class termsandcondition extends StatelessWidget {
  const termsandcondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
          title: Text('Terms and Condition'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Terms and Condition',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome to Moviemate!',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ]),
        ));
  }
}
