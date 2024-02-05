import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import '../pages/privacy_policy.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime? selectedDate;
  bool showPersonalDetailsForm = false;
  bool privacyPolicy = false;
  bool TermsandCondition = false;
  bool Aboutus = false;

  String _selectedGender = '';
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Settings",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://example.com/your_avatar_image.jpg'),
              radius: 40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showPersonalDetailsForm = !showPersonalDetailsForm;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 200),
              ],
            ),
          ),
          if (showPersonalDetailsForm)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 295),
                  child: Text("Gender",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showPersonalDetailsForm = !showPersonalDetailsForm;
                          });
                        },
                        child: RadioListTile(
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showPersonalDetailsForm = !showPersonalDetailsForm;
                          });
                        },
                        child: RadioListTile(
                          title: const Text('Female'),
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260),
                  child: Text(
                    'Date of Birth',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DateTimeField(
                      format: format,
                      decoration: InputDecoration(
                        labelText: 'Select Date of Birth',
                      ),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime.now(),
                        );
                      }),
                ),
              ],
            ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Privacy Policy",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              setState(() {
                TermsandCondition = !TermsandCondition;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Terms and Condition",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {
              setState(() {
                Aboutus = !Aboutus;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "About Us",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
