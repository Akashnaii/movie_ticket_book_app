import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Booking History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images3.alphacoders.com/165/thumb-1920-165265.jpg'),
                  ),
                  title: Text('Movie Name $index'),
                
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Show movie details dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Movie Details'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://images3.alphacoders.com/165/thumb-1920-165265.jpg',
                                width: 200,
                                height: 200,
                              ),
                              SizedBox(height: 10),
                              Text('Movie Name: Movie Name $index'),
                              Text('Theater Name: Theater Name $index'),
                              Text('Showtime: 10:00 AM'),
                              Text('Total Price: \$25.50'), // Example total price
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
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
