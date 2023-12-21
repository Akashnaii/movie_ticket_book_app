import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemate/pages/otp_get.dart';

class phonenoscreen extends StatefulWidget {
  const phonenoscreen({super.key});

  @override
  State<phonenoscreen> createState() => _phonenoscreenState();
}

class _phonenoscreenState extends State<phonenoscreen> {
  TextEditingController phonecontroller = TextEditingController();
  String verificationId = "";
  var phone = '';

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      // margin and padding maate..container usee..
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom:25),
        alignment: Alignment.center,
        // jyare biju device  ne pn scorring maa problem naa pde teni maatenu widget...
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset("assets/Movie-Ticket-Booking.png",
                height: 150,
                //   fit: BoxFit.cover,
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
                " we need to register your phone !!!",
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
                    value = phone;
                  },
                  keyboardType: TextInputType.phone,
                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.call)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                width: 275,
                child: ElevatedButton(
                  onPressed: () async {
                    //    send otp code
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+91${phonecontroller.text}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {},
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpGet()));
                    print("otp sent to $phonecontroller");
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.confirmation_num), Text("Send OTP")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
