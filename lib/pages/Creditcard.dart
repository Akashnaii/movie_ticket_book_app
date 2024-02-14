import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'Input_information.dart';

class CreditCardScreen extends StatefulWidget {
  final String? theaterName;
  final String? showtime;
  final List<String> selectedSeats;
  final double totalPrice;
  final String movieName;
  final String imageUrl;
  const CreditCardScreen({Key? key, this.theaterName, this.showtime, required this.selectedSeats, required this.totalPrice, required this.movieName, required this.imageUrl}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenstate();
  
}

class _CreditCardScreenstate extends State<CreditCardScreen> {

  TextEditingController cardnumberController = TextEditingController();
  TextEditingController date = TextEditingController();
  DateTime? startDate;
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
        firstDate:DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days:3650)));

    setState(() {
      date.text = DateFormat('MM/yyyy').format(startDate??DateTime.now()).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
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
            child: Column(
              children: [
                Column(
                  children: [
                    // const Spacer(),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(12),
                        CardNumberInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        hintText: "Card Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.credit_card),
                      ),
                    ),
                    SizedBox(height: 15),
                     TextFormField(
                       inputFormatters: [
                         FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                       ],

                       decoration: InputDecoration(
                         hintText: "Full Name",
                         prefixIcon: Icon(Icons.person),
                         border: OutlineInputBorder(),

                       ),
                     ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                // Limit the Number
                                inputFormatters:[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                                decoration: InputDecoration(
                                  hintText: "CVV",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.lock),

                                )
                            )
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                            child: TextFormField(
                              readOnly: true,
                                onTap: (){
                                  setState(() {
                                    openDatePicker();
                                  });
                                },
                              controller: date,
                              keyboardType: TextInputType.number,
                                // Limit the Number
                                inputFormatters:[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  CardMonthInputerFormatter(),
                                ],
                                decoration: InputDecoration(
                                  hintText: startDate != null? "${startDate?.month}/${startDate?.year}" :"MM/YY",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.calendar_month),
                                ),
                            ),
                        ),
                      ],
                    ),
                    ],
                    ),
                Padding(
                  padding: const EdgeInsets.only(top:60),
                  child:Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(child: Text("Submit",style: TextStyle(fontSize: 18),),
                    onPressed: () {},

                  ),
                ),
                ),

              ],
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



