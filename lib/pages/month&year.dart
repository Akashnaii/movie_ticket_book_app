import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  TextEditingController cardnumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  DateTime? expiryDate;
  String validationMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("New Card"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Your existing form fields...

                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(
                          hintText: "CVV",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        onTap: (){
                          openDatePicker();
                        },
                        controller: date,
                        decoration: InputDecoration(
                          hintText: startDate != null? "${startDate?.month}/${startDate?.year}" :"MM/YY",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      validateCardDetails();
                    },
                    child: Text("Submit"),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  validationMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _selectExpiryDate(BuildContext context) async {
  //   DateTime currentDate = DateTime.now();
  //   DateTime? picked = await ShowMonthYearPicker(
  //     context: context,
  //     firstDate: DateTime(currentDate.year, currentDate.month),
  //     lastDate: DateTime(currentDate.year + 10, currentDate.month),
  //     initialDate: expiryDate ?? currentDate,
  //     locale: Locale("en"),
  //   );
  //
  //   if (picked != null && picked != expiryDate) {
  //     setState(() {
  //       expiryDate = picked;
  //       validationMessage = ''; // Reset validation message when selecting a new date.
  //     });
  //   }
  // }
  DateTime? startDate;
  TextEditingController date = TextEditingController();

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
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.monthsPerYear),
        lastDate: DateTime.now().add(const Duration(days: 30)));

    setState(() {
      date.text = DateFormat('dd-MM-yyyy').format(startDate!).toString();
    });
  }

  void validateCardDetails() {
    // Add your validation logic here based on card details
    if (expiryDate == null) {
      setState(() {
        validationMessage = 'Please select a valid month and year.';
      });
    } else {
      DateTime currentDate = DateTime.now();
      if (expiryDate!.isBefore(currentDate) ||
          expiryDate!.month > 12 ||
          expiryDate!.year > currentDate.year + 10) {
        setState(() {
          validationMessage = 'Invalid card details.';
        });
      } else {
        setState(() {
          validationMessage = 'Card details are valid!';
        });
      }
    }
  }
}
