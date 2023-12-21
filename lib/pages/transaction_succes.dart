import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';


class TransectionSuccessfull extends StatefulWidget {
  const TransectionSuccessfull({super.key});

  @override
  State<TransectionSuccessfull> createState() => _TransectionSuccessfullState();
}

class _TransectionSuccessfullState extends State<TransectionSuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              padding: const EdgeInsets.only(top:30),
              height: 220,
              width: 280,
             child: Lottie.asset("assets/images/sus.json"),
            ),
            SizedBox(height: 30),
           Text("Transaction Successfull ",style:TextStyle(
             fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white,
           ),
           ),
            const SizedBox(height: 310),
            ElevatedButton(onPressed: (){

            },
              style: ButtonStyle(
                fixedSize:MaterialStateProperty.all<Size>(
                  Size(185, 55),)
              ),
              child: Text("Done",style:TextStyle(
                fontStyle: FontStyle.normal,fontSize: 20,color: Colors.white ),
              ),
              ),
            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }
}
