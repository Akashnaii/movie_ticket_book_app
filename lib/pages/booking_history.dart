import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  final String? imageUrl;
  final String? itemName;
  final String? theaterName;
  final String? showTime;
  final double? totalPrice;
  final String? eventType; // Updated to accept nullable strings

  const BookingHistory({
    Key? key,
    this.imageUrl,
    this.itemName,
    this.theaterName,
    this.showTime,
    this.totalPrice,
    this.eventType,
  }) : super(key: key);

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use the arrow back icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when pressed
          },
        ),
      ),
      body: widget.imageUrl != null // Check if event data is available
          ? Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl!),
            ),
            title: Text(widget.itemName ?? ''),
            subtitle: Text('Type: ${widget.eventType ?? 'Unknown'}'), // Display the event type if available
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
                            widget.imageUrl!,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 200,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Event Name: ${widget.itemName ?? ''}'),
                        Divider(thickness: 2, color: Colors.black),
                        Text('Theater Name: ${widget.theaterName ?? ''}'),
                        Divider(thickness: 2, color: Colors.black),
                        Text('Showtime: ${widget.showTime ?? ''}'),
                        Divider(thickness: 2, color: Colors.black),
                        Text('Total Price: \$${widget.totalPrice?.toStringAsFixed(2) ?? ''}'),
                        Divider(thickness: 2, color: Colors.black),
                        Text('Event Type: ${widget.eventType ?? ''}'),
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
          ),
          // Add more widgets or expand the list as needed
        ],
      )
          : Center(
        child: Text('No booking history available'), // Display a message when no event data is available
      ),
    );
  }
}
