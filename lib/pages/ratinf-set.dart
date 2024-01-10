import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class rating extends StatelessWidget {
  final TextEditingController _ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Rating Bar Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _ratingController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  double rating = double.tryParse(value) ?? 0.0;
                  rating = rating.clamp(1.0, 5.0);
                  _ratingBarController.rating = rating;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Rating (1-5)',
                ),
              ),
              SizedBox(height: 20),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40.0,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: _ratingBarController.rating >= index + 1
                        ? Colors.amber
                        : Colors.grey[300],
                  );
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBarController {
  double rating = 0;
}

RatingBarController _ratingBarController = RatingBarController();
