import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Theater extends StatefulWidget {
  const Theater({Key? key});

  @override
  State<Theater> createState() => _TheaterState();
}

class _TheaterState extends State<Theater> {
  final firestore =
      FirebaseFirestore.instance.collection('theater').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshots.hasError) {
                  return Text('Some error is occurring');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                          snapshots.data!.docs[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),)),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                    },
                                    icon: Icon(Icons.location_on),
                                  ),
                                ],
                              ),
                              // Use in the showtime .. list..
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () {
                                        print('tapped');
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '10:00 am',
                                            style: TextStyle(
                                                color: Color(0xFF4BB33B)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
