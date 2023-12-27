import 'package:flutter/material.dart';

class theater extends StatefulWidget {
  const theater({super.key});

  @override
  State<theater> createState() => _theaterState();
}

class _theaterState extends State<theater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (contex, index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Color(0x97C5B7FF),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('theater name assing'),
                              Spacer(),
                              Icon(Icons.location_on),
                            ],
                          ),
                          // use in the showtime .. list..
                          SizedBox(height: 6),
                         Row(
                           children: List.generate(
                             4,
                                 (index) => Padding(
                                   padding: const EdgeInsets.only(left : 7 , right: 10, top: 20),
                                   child: Container(

                                     color: Colors.white,
                               height: 30,
                               child: Center(child: Text('10:00 am')), // Replace with actual time
                             ),
                                 ),
                           ),
                         )

                        ],
                      ),

                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
