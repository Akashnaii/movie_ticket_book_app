import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:moviemate/pages/phone_auth.dart';
import 'package:moviemate/pages/naviagation_bar.dart';

class OtpGet extends StatefulWidget {
  const OtpGet({Key? key});

  @override
  State<OtpGet> createState() => _OtpGetState();
}

class _OtpGetState extends State<OtpGet> {
  TextEditingController otpController = TextEditingController();
  String verificationId = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _verifyOtp() async {
    try {
      // Create a PhoneAuthCredential using the verification ID and entered OTP
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text, // Use otpController.text here
      );

      // Sign in with the credential to complete the verification
      final UserCredential authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is signed in
      if (authResult.user != null) {
        // The OTP is valid, navigate to the main app screen or perform further actions
        Navigator.push(context, MaterialPageRoute(builder: (context) => phonenoscreen()));
        print("OTP is valid");
      } else {
        // The OTP is invalid
        print("Invalid OTP");
      }
    } catch (e) {
      print("Error verifying OTP: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code="";
    return Scaffold(
      // margin and padding maate..container usee..
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 15, bottom: 20),
        alignment: Alignment.center,
        // jyare biju device  ne pn scorring maa problem naa pde teni maatenu widget...
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
              onChanged: (value){
                code=value;
              },
              validator: (s) {
                return s == verificationId ? null : 'incorrect pin';
              },

            ),
          ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async{
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:  phonenoscreen.verify, smsCode:code);
                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushAndRemoveUntil(
                          context, "home_p" as Route<Object?>,(route) => false);
                    }
                    catch(e){
                      print('wrong otp');
                    }
                    _verifyOtp();

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
