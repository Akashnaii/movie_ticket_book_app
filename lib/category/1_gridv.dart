import 'package:flutter/material.dart';

class grid_1 extends StatefulWidget {
  const grid_1({Key? key}) : super(key: key);

  @override
  State<grid_1> createState() => _grid_1State();
}

class _grid_1State extends State<grid_1> {
  List<String> _pics = [
    'https://www.newsbricks.com/root_upld/content-images/article/12876/valimai-movie-poster-2.jpg',
    'https://tse4.mm.bing.net/th?id=OIP.1oChlLDscMn5Rj8BAf46QwHaH8&pid=Api&P=0&h=180',
    'https://www.filmibeat.com/ph-big/2015/12/trending-movie-in-google-2015_145043549570.jpg',
    'https://tse2.mm.bing.net/th?id=OIP.R7_eg7pvGZDs7XH8hjC3uQHaEK&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.R7_eg7pvGZDs7XH8hjC3uQHaEK&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.R7_eg7pvGZDs7XH8hjC3uQHaEK&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.R7_eg7pvGZDs7XH8hjC3uQHaEK&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.R7_eg7pvGZDs7XH8hjC3uQHaEK&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.R7_eg7pvGZDs7XH8hjC3uQHaEK&pid=Api&P=0&h=180',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
      body: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 18,
          mainAxisSpacing: 14,
        ),
        itemCount: _pics.length,
        itemBuilder: (context, index) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                //width: 120,
                //padding: EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
                // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_pics[index]),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Center(child: Text('Valimal', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),))
            ],
          );
        },
      ),
      ),
    );

  }
}
