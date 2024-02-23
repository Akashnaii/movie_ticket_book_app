import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviemate/Navigationbar/privacy_policy.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Terms_Condition.dart';
import 'aboutus.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final format = DateFormat("yyyy-MM-dd");
  String? _selectedGender;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? _selectedDOB;
  bool showPersonalDetailsForm = false;
  bool userDetail = false;
  // String? userName;
  // String? userDate;
  // String? userGender;
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }
  Future<void> getUserDetails()async{
    DocumentSnapshot<Map<String, dynamic>> userDetails =await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();

     setState(() {
       nameController.text = userDetails['name'];
       _selectedGender = userDetails['gender'];
       dateController.text = userDetails['dateOfBirth'];
     });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text(
            'Settings',
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    showPersonalDetailsForm = !showPersonalDetailsForm;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Male';
                              });
                            },
                            child: RadioListTile(
                              title: const Text('Male'),
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
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
                                _selectedGender = 'Female';
                              });
                            },
                            child: RadioListTile(
                              title: const Text('Female'),
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
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
                        controller: dateController,
                        format: format,
                        initialValue: _selectedDOB ?? DateTime.now(),
                        decoration: InputDecoration(
                          labelText: 'Select Date of Birth',
                        ),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: _selectedDOB ?? DateTime.now(),
                            lastDate: DateTime.now(),
                            initialDatePickerMode: DatePickerMode.day,
                          );
                        },
                      ),


                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async{
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .update({
                            'name': nameController.text,
                            'dateOfBirth': dateController.text,
                            'gender': _selectedGender,
                          });
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=> termsandcondition()));
                },
                child: const Padding(
                  padding:  EdgeInsets.only(left: 15),
                  child:  Text(
                    "Terms and Condition",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=> aboutus()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () async{
                        try
                            {
                              await FirebaseAuth.instance.signOut();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('isloggedIn', false);
                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>PhoneAuth()));
                            }
                            catch(e)
                        {
                          Text("error for the log out : $e");
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(165, 55),
                        ),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
