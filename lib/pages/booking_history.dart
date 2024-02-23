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
              physics: BouncingScrollPhysics(),
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
                            scrollable: true,
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
                                SizedBox(height: 25),
                                Text('Movie Name' , style: TextStyle(fontSize: 12 ,color: Colors.black , fontWeight: FontWeight.bold),),
                                Divider(thickness: 2, color: Colors.grey),
                                Text(snapshot.data!.docs[index]['name'].toString() ?? ''),
                                // SizedBox(height: 5,),
                                SizedBox(height: 15,),
                                Text('Selected Date' , style: TextStyle(fontSize: 12 , color: Colors.black , fontWeight: FontWeight.bold),),
                                Divider(thickness: 2, color: Colors.grey),

                                Text(snapshot.data!.docs[index]['selectedDate'].toString()),
                                SizedBox(height: 15,),
                                Text('Selected Seats' , style: TextStyle(fontSize: 12 , color: Colors.black , fontWeight: FontWeight.bold),),
                                Divider(thickness: 2, color: Colors.grey),

                                Text(snapshot.data!.docs[index]['selectedSeats'].toString()),
                                SizedBox(height: 15,),
                                Text('Selected Time' , style: TextStyle(fontSize: 12 , color: Colors.black , fontWeight: FontWeight.bold),),
                                Divider(thickness: 2, color: Colors.grey),

                                Text(snapshot.data!.docs[index]['showtime'].toString()),

                                SizedBox(height: 15,),
                                Text('Theater Name' , style: TextStyle(fontSize: 12 , color: Colors.black , fontWeight: FontWeight.bold),),
                                Divider(thickness: 2, color: Colors.grey),
                                Wrap(
                                  children: [
                                    Text(snapshot.data?.docs[index]['theaterName'] ??''),
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
