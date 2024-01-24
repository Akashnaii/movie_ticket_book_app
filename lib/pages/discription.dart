import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Disc extends StatefulWidget {
  const Disc({Key? key}) : super(key: key);

  @override
  State<Disc> createState() => _DiscState();
}

class _DiscState extends State<Disc> {
  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/7/73/Ranbir_Kapoor.jpg',
    'https://file.oyephoto.com/uploads/preview/rashmika-mandanna-photos-wallpapers-hd-11617545979c32riwv9vw.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQacUB_py09D4ptqAQmxMVdR3NC6Nra62_kSVJZT4ER3c26ramUXU3lRX4UQ&s',
    'https://e0.pxfuel.com/wallpapers/126/237/desktop-wallpaper-anil-kapoor-and-thumbnail.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgH6OvrfnLgbC-PCBqci6D5kOFmUyGkT7n6CHT2mwJXA&s',
  ];
  final List<String> imagname = [
    'Ranbir Kapoor',
    'Rasmika Mandana',
    'Bobby Deol',
    'Anil Kapoor',
    'Tripti Dimri',
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController _ratingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.only(left: 10, top: 10),
              height: 350,
              width: double.infinity,
              child: Image.network(
                'https://img.youtube.com/vi/zqGW6x_5N0k/0.jpg',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('The Animal Movie',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10), // Adjust the horizontal padding as needed
              child: Text(
                "This is the story of a son whose love for his father knows no bounds. As their bond begins to fracture, a chain of extraordinary events unfold causing the son to undergo a remarkable transformation consumed by a thirst for vengeance.",
                style: TextStyle(
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
                initialRating:
                    4.5, // Set the initialRating to 4.5 to have 4 stars and 1 half star
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.0,
                itemBuilder: (context, index) {
                  // Check if the current index corresponds to the half star when rating is 4.5
                  if (_ratingBarController.rating == 4 && index == 4) {
                    return Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    );
                  }

                  return Icon(
                    Icons.star,
                    color: _ratingBarController.rating >= index + 1
                        ? Colors.amber
                        : Colors.grey[300],
                  );
                },
                onRatingUpdate: (rating) {
                  _ratingBarController.rating = rating;
                },
              ),
            ),
            SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Cast',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: const EdgeInsets.all(11),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: NetworkImage(imageUrls[index]),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                width: 62,
                                child: Text(
                                  imagname[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Book Ticket',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 12), // Adjust the padding as needed
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class RatingBarController {
  double rating = 4.0;
}

RatingBarController _ratingBarController = RatingBarController();
