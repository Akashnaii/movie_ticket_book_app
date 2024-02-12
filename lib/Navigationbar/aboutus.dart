import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJFvbwxpNXXxDBQNkgnuqN21CgljE8aOD2Eg&usqp=CAU',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            // Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'About Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Introducing Moviemate: Your Ultimate Destination for Cinematic Bliss',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              aboutussection(title: '', content: '''
Step into the world of Moviemate, where the thrill of the silver screen meets the convenience of modern technology. As avid moviegoers ourselves, we understand the excitement of discovering the latest releases, planning movie nights with friends, and immersing ourselves in captivating stories. That's why we created Moviemate: to bring the magic of cinema to your fingertips and revolutionize the way you experience movies.
            
At Moviemate, we're committed to making your movie-watching experience seamless, enjoyable, and unforgettable. Whether you're a cinephile seeking out the latest indie gems or a casual movie buff looking for a fun night out, Moviemate has everything you need to enhance your cinematic journey.

With our user-friendly app, you can easily explore movies playing in theaters near you, check showtimes, and book tickets in just a few taps. Say goodbye to long queues and last-minute ticket scrambles; with Moviemate, you're always just a few clicks away from your next cinematic adventure.        
              '''),
            ]),
          ]),
        ),
      ),
    );
  }
}

class aboutussection extends StatelessWidget {
  final String title;
  final String content;

  const aboutussection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
