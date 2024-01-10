import 'package:flutter/material.dart';


class dropdownlist extends StatefulWidget {
  const dropdownlist({super.key});

  @override
  State<dropdownlist> createState() => _dropdownlistState();
}

class _dropdownlistState extends State<dropdownlist> {
  String dropdownValue = "Movies";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          hint: Text("Select movies"),
          icon: const Icon(Icons.menu),
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (newValue){
            setState(() {
               dropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem<String>(
              value: 'Movies',
              child: Text("Movies"),
            ),
            DropdownMenuItem<String>(
              value: 'Standup Comedy',
              child: Text("Standup Comedy"),
            ),
            DropdownMenuItem<String>(
              value: 'Consert',
              child: Text("Consert"),
            ),
          ],
        ),
      ),
    );
  }
}
