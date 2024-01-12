import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshots.hasError) {
                  return const Text('Some error is occurring');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFFFFFF),
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
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                          ),
                                          context: context,
                                          builder: (context) => SingleChildScrollView(
                                            child: Container(
                                                  padding: const EdgeInsets.all(20),
                                                  height: 220,
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Text(
                                                            'Name : ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.w300),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width*0.7,
                                                            child: Text(
                                                              '${snapshots.data!.docs[index]['name']}',
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.w300),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(height: 15),
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Text(
                                                            'Address : ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.w300),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width*0.6,
                                                            child: Text(
                                                              '${snapshots.data!.docs[index]['address']}',
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.w300),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          ));
                                    },
                                    icon: const Icon(Icons.location_on),
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
                                          MaterialPageRoute(builder: (context) => const Seatselect()),
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
                                        child: const Center(
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
