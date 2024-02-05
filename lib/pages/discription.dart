import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescriptionPage extends StatefulWidget {
final QueryDocumentSnapshot snapshot;


  const DescriptionPage({Key? key , required this.snapshot}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();

}

class _DescriptionPageState extends State<DescriptionPage> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.snapshot['rating'] ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.network(
               widget.snapshot['image_url'],
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
               widget.snapshot['name'],
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    color: rating >= index + 1 ? Colors.amber : Colors.grey[300],
                  );
                },
                onRatingUpdate: (newRating) {
                  setState(() {
                    // rating = newRating;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Cast',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 4),
            SingleChildScrollView(
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
                          backgroundImage: NetworkImage(widget.snapshot['Cast'][index]['cast_image']),
                        ),
                        SizedBox(height: 6),
                        Container(
                          width: 70,
                          child: Text(
                           widget.snapshot['Cast'][index]['cast_name'],
                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                ),
                child:  const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Book Ticket',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
