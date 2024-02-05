import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();

}

class _SettingScreenState extends State<SettingScreen> {
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
          appBar: AppBar(
            centerTitle: true,
            elevation: 2,
            backgroundColor: Colors.white,
            title: const Text(
              'Setting',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Perform Navigator.pop operation
              },
            ),
          ),
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
SizedBox(height: 20),
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
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
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
