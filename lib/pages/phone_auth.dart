import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemate/pages/otp_get.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();

  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
      builder: (_) => PhoneAuth(),
    );
  }
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phonecontroller = TextEditingController();
  bool loading = false;
  String verificationId = "";
  var phone = '';
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/Movie-Ticket-Booking.png",
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  " Phone Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  " We need to register your phone !!!",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: phonecontroller,
                    onChanged: (value) {
                      phone = value;
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.call),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: errorText.isNotEmpty
                      ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                      child: Text(
                        errorText,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                      : Container(),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: 275,
                  child: ElevatedButton(
                    onPressed: loading ? null : _sendOTP,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.confirmation_num),
                        SizedBox(width: 10),
                        Text("Send the OTP"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
          Visibility(
            visible: loading, // Show loading indicator if loading is true
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
    ]
      ),
    );
  }

  // Function to send OTP
  Future<void> _sendOTP() async {
    if (phone.length != 10) {
      setState(() {
        errorText = 'Please enter a 10-digit phone number';
      });
    } else {
      try {
        setState(() {
          loading = true;
          errorText = '';
        });

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91${phonecontroller.text}',
          verificationCompleted: (PhoneAuthCredential credential) {
            setState(() {
              loading = false;
            });
          },
          verificationFailed: (FirebaseAuthException e) {
            setState(() {
              loading = false;
            });
            print('Verification Failed: $e');
          },
          codeSent: (String verificationId, int? resendToken) {
            setState(() {
              loading = false;
              this.verificationId = verificationId;
            });

            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => OtpGet(verificationId: verificationId)),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            setState(() {
              loading = false;
            });
          },
        );
      } catch (e) {
        setState(() {
          loading = false;
        });
        print('Error sending OTP: $e');
      }
    }
  }
}
