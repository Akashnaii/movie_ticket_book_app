import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registration_p extends StatefulWidget {
  const registration_p({Key? key}) : super(key: key);

  @override
  State<registration_p> createState() => _registration_pState();
}

class _registration_pState extends State<registration_p> {
  String _selectedGender = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  DateTime? _selectedDate;
  String? _nameError;
  String? _dobError;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text(
            'User profile',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorText: _nameError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _dobController,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Date of Birth',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        errorText: _dobError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Select your Gender',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Expanded(
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
                  Expanded(
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
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async{
                    _validateFields();
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=> HomeScreen()));
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(50, 50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 60, right: 60),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  void _validateFields() {
    setState(() {
      if (_nameController.text.isEmpty) {
        _nameError = 'Name cannot be empty';
      } else {
        _nameError = null;
      }

      if (_selectedDate == null) {
        _dobError = 'Please select a valid date of birth';
      } else {
        _dobError = null;
      }
    });

    if (_nameError == null && _dobError == null) {
      _submitForm();
    }
  }

  void _submitForm() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth firestoreAuth = FirebaseAuth.instance;

    firestore.collection('users').doc(firestoreAuth.currentUser?.uid).set({
      'uid':firestoreAuth.currentUser?.uid,
      'name': _nameController.text,
      'dateOfBirth': _dobController.text,
      'gender': _selectedGender,
    })
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User data updated successfully'),
          duration: Duration(seconds: 2),
        ),
      );
      // Navigate to the HomeP page only after successful form submission
      Navigator.push(context, CupertinoPageRoute(builder: (context)=> HomeScreen()));
    })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add user data: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

}
