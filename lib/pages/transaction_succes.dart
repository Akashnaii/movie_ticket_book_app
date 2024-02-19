import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemate/pages/home_p.dart';

class TransactionSuccessful extends StatefulWidget {
  final String? theaterName;
  final String? showtime;
  final List<String> selectedSeats;
  final double totalPrice;
  final String movieName;
  final String imageUrl;
  final String selectedDate;

  const TransactionSuccessful(
      {
        super.key,
      this.theaterName,
      this.showtime,
      required this.selectedSeats,
      required this.totalPrice,
      required this.movieName,
      required this.imageUrl,
        required this.selectedDate});

  @override
  State<TransactionSuccessful> createState() => _TransactionSuccessfulState();
}

class _TransactionSuccessfulState extends State<TransactionSuccessful> {

  Future<void> addHistory() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth firestoreAuth = FirebaseAuth.instance;

    firestore.collection('users').doc(firestoreAuth.currentUser?.uid).collection("BookingHistory").add({
      'image_url' : widget.imageUrl,
      'name': widget.movieName,
      'theaterName': widget.theaterName,
      'showtime': widget.showtime,
      'selectedSeats': widget.selectedSeats,
      'totalPrice': widget.totalPrice,
      'selectedDate': widget.selectedDate,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking History Add Successfully'),
          duration: Duration(seconds: 2),
        ),
      );
      // Navigate to the HomeP page only after successful form submission
      Navigator.push(context, CupertinoPageRoute(builder: (context)=> HomeP()));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add user data: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(top: 30),
              height: 220,
              width: 280,
              child: Lottie.asset("assets/sus.json"),
            ),
           const SizedBox(height: 30),
            const Text(
              "Transaction Successfull ",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 310),
            ElevatedButton(
              onPressed: () {
                addHistory();
                // Navigator.push(
                //     context, CupertinoPageRoute(builder: (context) => const HomeP()));
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                const Size(185, 55),
              )),
              child: const Text(
                "Done",
                style:  TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.deepPurple),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
