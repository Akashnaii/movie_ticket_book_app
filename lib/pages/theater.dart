import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moviemate/pages/raw.dart';
import 'package:moviemate/pages/seat_selection.dart';

class Theater extends StatefulWidget {
  const Theater({Key? key});

  @override
  State<Theater> createState() => _TheaterState();
}

class _TheaterState extends State<Theater> {
  final title = FirebaseFirestore.instance.collection('movies').snapshots();
  final firestore =
      FirebaseFirestore.instance.collection('theater').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 120,
                width: double.infinity,
                child: EasyInfiniteDateTimeLineExample()),
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
                                        snapshots.data!.docs[index]['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                          ),
                                          context: context,
                                          builder: (context) =>
                                              SingleChildScrollView(
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  height: 220,
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Name : ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            child: Text(
                                                              '${snapshots.data!.docs[index]['name']}',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Address : ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                            child: Text(
                                                              '${snapshots.data!.docs[index]['address']}',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ));
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Seatselect()),
                                        );
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
