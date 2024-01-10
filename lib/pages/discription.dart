import 'package:flutter/material.dart';

class Disc extends StatefulWidget {
  const Disc({Key? key}) : super(key: key);

  @override
  State<Disc> createState() => _DiscState();
}

class _DiscState extends State<Disc> {
  final List<String> imageUrls = [
    'https://res.cloudinary.com/jerrick/image/upload/f_auto,fl_progressive,q_auto,c_fit,w_1100/tqo1sq4lgnzivejihljo',
    'https://res.cloudinary.com/jerrick/image/upload/f_auto,fl_progressive,q_auto,c_fit,w_1100/tqo1sq4lgnzivejihljo',
    'https://res.cloudinary.com/jerrick/image/upload/f_auto,fl_progressive,q_auto,c_fit,w_1100/tqo1sq4lgnzivejihljo',
    'https://res.cloudinary.com/jerrick/image/upload/f_auto,fl_progressive,q_auto,c_fit,w_1100/tqo1sq4lgnzivejihljo',
    'https://res.cloudinary.com/jerrick/image/upload/f_auto,fl_progressive,q_auto,c_fit,w_1100/tqo1sq4lgnzivejihljo',
  ];
  final List<String> imagname= ['ranbir', 'rasmika', 'anil', 'akky', 'aayush'];

  @override
  Widget build(BuildContext context) {
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
                'https://nationalzoo.si.edu/sites/default/files/animals/cheetah-002.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 06),
              child: Text('the animal movie',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the horizontal padding as needed
              child: Text(
                "A father, who is often away due to work, is unable to comprehend "
                    "the intensity of his son's fervent love and admiration, which creates "
                    "conflict between both of them.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 06),
              child: Text('Cast',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) => Padding(
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageUrls[index]),
                      ),
                      SizedBox(height: 10,),
                      Text(imagname[index],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Book Ticket',style: TextStyle(fontSize:16 ),),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16), // Adjust the padding as needed
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
