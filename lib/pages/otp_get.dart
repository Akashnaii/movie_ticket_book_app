import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/pages/home_p.dart';
import 'package:pinput/pinput.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:moviemate/pages/naviagation_bar.dart';

class OtpGet extends StatefulWidget {
  const OtpGet({Key? key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpGet> createState() => _OtpGetState();
}

class _OtpGetState extends State<OtpGet> {
  TextEditingController otpController = TextEditingController();
  bool loading = false;
  String correctOTP = '';
  Future<void> _verifyOtp() async {
    try {
      // Create a PhoneAuthCredential using the verification ID and entered OTP
      final AuthCredential credential = PhoneAuthProvider.credential(
        smsCode: otpController.text,
        verificationId: widget.verificationId, // Use otpController.text here
      );

      // Sign in with the credential to complete the verification
      final UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is signed in
      if (authResult.user != null) {
        setState(() {
          loading = false;
        });
        // The OTP is valid, navigate to the main app screen or perform further actions
        Navigator.push(context, MaterialPageRoute(builder: (context) => home_p()));
      } else {
        // The OTP is invalid
        setState(() {
          loading = false;
        });
        // Text(" incorrect pin ", style: TextStyle(color: Colors.red),);
      }
    } catch (e) {
      setState(() {
         loading = false;
      });
      Text(" incorrect pin ", style: TextStyle(color: Colors.red),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 15, bottom: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/otp.png",
                height: 180,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                " OTP Verification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                " we need to verify your otp !!!",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 22,
              ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Pinput(
              controller: otpController,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            length: 6,
              // validator: (s) {
              //   return s == correctOTP ? null : 'incorrect pin';
              // },

            ),
          ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    _verifyOtp();
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const nav()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Icon(Icons.confirmation_num),
                      Text("Verify OTP")
                    ],
                  ),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => phonenoscreen()));
                  },
                  child: Text(
                    'Edit Phone Number ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
