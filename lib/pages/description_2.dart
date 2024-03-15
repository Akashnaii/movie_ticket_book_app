import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviemate/pages/seat_selection.dart';
import 'package:moviemate/pages/theater.dart';

class DescriptionPage2 extends StatefulWidget {
  final QueryDocumentSnapshot snapshot;

  const DescriptionPage2({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<DescriptionPage2> createState() => _DescriptionPage2State();
}

class _DescriptionPage2State extends State<DescriptionPage2> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = double.tryParse(widget.snapshot['rating'].toString()) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: const Text(
            'Description',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///main image
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.snapshot['image_url'],
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),

              ///Movie Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.snapshot['name'],
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),

              ///Movie description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.snapshot!['description'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),

              ///Movie rating
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RatingBar.builder(
                  initialRating: rating,
                  ignoreGestures: true,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, index) {
                    if (rating == index + 0.5) {
                      return const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                      );
                    }
                    return Icon(
                      Icons.star,
                      color:
                          rating >= index + 1 ? Colors.amber : Colors.grey[300],
                    );
                  },
                  onRatingUpdate: (newRating) {
                    setState(() {
                      // rating = newRating;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.location_on,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        widget.snapshot!['location'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
Row(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Icon(
        Icons.calendar_today,
        size: 22,
        color: Colors.grey,
      ),
    ),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Text(
        widget.snapshot!['date'],
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.left,
      ),
    ),
  ],
),
              const SizedBox(height: 32),
              ///Movie cast
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Cast',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 4),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    widget.snapshot['Cast'].length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(11),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                widget.snapshot['Cast'][index]['cast_image']),
                          ),
                         const SizedBox(height: 6),
                          Container(
                            width: 70,
                            child: Text(
                              widget.snapshot['Cast'][index]['cast_name'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // const Spacer(),
              const SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomAppBar(
            color: Colors.transparent,
            child: Container(
              // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => SeatSelection(
                            movieName: widget.snapshot['name'],
                            imageUrl: widget.snapshot['image_url'],
                            selectedDate: widget.snapshot['selectedDate'],
                            location: widget.snapshot['location'])),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(185, 55),
                  ),
                ),
                child: Text(
                  "Book Ticket",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
