import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:moviemate/pages/transaction_succes.dart';
import 'Input_information.dart';
import 'home_p.dart';

class CreditCardScreen extends StatefulWidget {
  final String? theaterName;
  final String? showtime;
  final List<String> selectedSeats;
  final double totalPrice;
  final String movieName;
  final String imageUrl;
  final String selectedDate;
  const CreditCardScreen(
      {Key? key,
        this.theaterName,
        this.showtime,
        required this.selectedSeats,
        required this.totalPrice,
        required this.movieName,
        required this.imageUrl, required this.selectedDate})
      : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenstate();
}

class _CreditCardScreenstate extends State<CreditCardScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cardnumberController = TextEditingController();
  TextEditingController date = TextEditingController();
  DateTime? startDate;

  String? cardNumberError;
  String? fullNameError;
  String? cvvError;
  String? expiryDateError;

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your card number';
    }

    // Reset error message if validation succeeds
    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }
  String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your CVV';
    } else if (value.length != 3) {
      return 'Please enter a valid CVV';
    }
    return null;
  }
  String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expiry date';
    }

    // Validate the format
    RegExp regex = RegExp(r"^\d{2}/\d{4}$");
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid expiry date (MM/YYYY)';
    }

    // Validate the month and year
    List<String> parts = value.split('/');
    int month = int.tryParse(parts[0]) ?? 0;
    int year = int.tryParse(parts[1]) ?? 0;
    if (month < 1 || month > 12 || year < DateTime.now().year || year > 9999) {
      return 'Please enter a valid expiry date (MM/YYYY)';
    }

    return null;
  }

  void openDatePicker() async {
    startDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    onPrimary: Theme.of(context).scaffoldBackgroundColor)),
            child: child!,
          );
        },
        initialDatePickerMode: DatePickerMode.year,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 3650)));

    setState(() {
      date.text =
          DateFormat('MM/yyyy').format(startDate ?? DateTime.now()).toString();
    });
  }
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
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) =>
                  TransactionSuccessful(
                    theaterName: widget.theaterName,
                    showtime: widget.showtime,
                    selectedSeats: widget.selectedSeats,
                    totalPrice: widget.totalPrice,
                    movieName: widget.movieName,
                    imageUrl: widget.imageUrl,
                    selectedDate: widget.selectedDate,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.black,
        title: const Text(
          'Payment Gateway',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      // const Spacer(),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: "Card Number",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.credit_card),
                          errorText: cardNumberError,
                        ),
                         // controller: cardnumberController,
                        validator: validateCardNumber,
                        onChanged: (value) {
                          setState(() {
                            cardNumberError = validateCardNumber(value);
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          errorText: fullNameError,
                        ),
                        validator: validateFullName,
                        onChanged: (value) {
                          setState(() {
                            fullNameError = validateFullName(value);
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  // Limit the Number
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "CVV",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.lock),
                                    errorText: cvvError,
                                  ),
                                obscureText: true,
                                validator: validateCVV,
                                onChanged: (value) {
                                  setState(() {
                                    cvvError = validateCVV(value);
                                  });
                                },
                                )),
                          const SizedBox(width: 25),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  openDatePicker();
                                });
                              },
                              controller: date,
                              keyboardType: TextInputType.number,
                              // Limit the Number
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                CardMonthInputerFormatter(),
                              ],
                              decoration: InputDecoration(
                                hintText: startDate != null
                                    ? "${startDate?.month}/${startDate?.year}"
                                    : "MM/YYYY",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.calendar_month),
                                errorText: expiryDateError,
                              ),
                              validator: validateExpiryDate,
                              onChanged: (value) {
                                setState(() {
                                  expiryDateError = validateExpiryDate(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 18 , color: Colors.white),
                        ),
                        onPressed: () {
                          debugPrint("widget.theaterName:${widget.theaterName}");
                          if (_formKey.currentState!.validate()) {
                           addHistory();
                          }
                          else
                          {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                          }

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" "); // Double space
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
