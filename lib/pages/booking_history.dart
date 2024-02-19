import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  final String? theaterName;
  final String? showtime;
  const BookingHistory({super.key, this.theaterName, this.showtime});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firestoreAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text(
            'Booking History',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('users').doc(firestoreAuth.currentUser?.uid).collection('BookingHistory').snapshots(),
      builder: (context , snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData){

          return  ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context , index){
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data!.docs[index]['image_url']),
                    ),
                    title: Text(snapshot.data!.docs[index]['name'].toString()),
                    subtitle: Text(snapshot.data!.docs[index]['totalPrice'].toString()), // Display the event type if available
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Show booking details dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Booking Details'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    snapshot.data!.docs[index]['image_url'],
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: 200,
                                  ),
                                ),
                                SizedBox(height: 5),
                                // Divider(thickness: 2, color: Colors.black),
                                Text(snapshot.data!.docs[index]['name'].toString()),
                                Divider(thickness: 2, color: Colors.black),
                                Text(snapshot.data!.docs[index]['selectedDate'].toString()),
                                Divider(thickness: 2, color: Colors.black),
                                Text(snapshot.data!.docs[index]['selectedSeats'].toString()),
                                Divider(thickness: 2, color: Colors.black),
                                Text(snapshot.data!.docs[index]['showtime'].toString()),
                                Divider(thickness: 2, color: Colors.black),
                                Wrap(
                                  children: [
                                    Text(widget.theaterName.toString()),
                                  ],
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    });
              });
        }else{
          return Center(
            child: Text('No booking history available.'),
          );
        }
      },
      )


    );
  }
}
