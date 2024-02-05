import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
      builder: (_) => BookingHistory(),
    );
  }
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
