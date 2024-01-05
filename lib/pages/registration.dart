import 'package:flutter/material.dart';

class registration_p extends StatefulWidget {
  const registration_p({super.key});

  @override
  State<registration_p> createState() => _registration_pState();
}

class _registration_pState extends State<registration_p> {
  String _selectedGender = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              //color: Colors.amberAccent,
              child: Center(
                  child: Text(
                " Registration page ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  //fillColor: Colors.green.shade100,
                  filled: true,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                maxLength: 8,
                decoration: InputDecoration(
                  //fillColor: Colors.green.shade100,
                  filled: true,
                  hintText: 'password',
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  //fillColor: Colors.green.shade100,
                  filled: true,
                  hintText: 'Name ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _mobileController,
                decoration: InputDecoration(
                  //fillColor: Colors.green.shade100,
                  filled: true,
                  hintText: 'mobile number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Select your Gender',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text('Male'),
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
                    title: Text('Female'),
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
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color of the button

                    onPrimary: Colors.white, // Text color of the button

                    elevation: 4, // Elevation (shadow) of the button

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                    minimumSize: Size(50, 50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Text('Sign Up', style: TextStyle(fontSize: 19),),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
