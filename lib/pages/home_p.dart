import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviemate/model/home_model.dart';




class home_p extends StatefulWidget {
  const home_p({super.key});

  @override
  State<home_p> createState() => _home_pState();
}


class _home_pState extends State<home_p> {
final firestore = FirebaseFirestore.instance.collection('movies').snapshots();
  //image url..
  List<String> imageurl1 = [
    'https://tse4.mm.bing.net/th?id=OIP.RZ4pRFZpS54YJDZo5XM00wHaEt&pid=Api&P=0&h=180',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/62332132039857.566bcebd67c82.jpg',
    'https://i.pinimg.com/originals/6c/2f/de/6c2fde0235ece77e4fc91f8ebe8d8739.jpg',
    'https://tse4.mm.bing.net/th?id=OIP.nyFLBYjD207JNHC4hBQBAwHaE8&pid=Api&P=0&h=180',
    'https://tse4.mm.bing.net/th?id=OIP.nyFLBYjD207JNHC4hBQBAwHaE8&pid=Api&P=0&h=180',
  ];
  List<String> imageurl2 = [
    'https://tse2.mm.bing.net/th?id=OIP.gF--XR-CwFzNmC-zfsJD1QHaKu&pid=Api&P=0&h=180',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/62332132039857.566bcebd67c82.jpg',
    'https://i.pinimg.com/originals/6c/2f/de/6c2fde0235ece77e4fc91f8ebe8d8739.jpg',
    'https://tse4.mm.bing.net/th?id=OIP.nyFLBYjD207JNHC4hBQBAwHaE8&pid=Api&P=0&h=180',
    'https://tse4.mm.bing.net/th?id=OIP.nyFLBYjD207JNHC4hBQBAwHaE8&pid=Api&P=0&h=180',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 12)),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 22),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            // icon: Icon(Icons.search),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),

                    // SizedBox(height: 5),
                    // first slide code...
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trending',
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),

                          // SizedBox(width: 225),
                          Spacer(),
                          TextButton(onPressed : (){} , child: Text('see all')),
                        ],
                      ),
                    ),
//SizedBox(height: 5),
                  StreamBuilder<QuerySnapshot>(
                      stream: firestore,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){
                        if(snapshots.connectionState == ConnectionState.waiting){
                          return CircularProgressIndicator();
                        }
                        if(snapshots.hasError)
                          return Text('some error is occuring');
                        return Container(
                          height: 210,
                          child: CarouselSlider.builder(
                            itemCount: snapshots.data!.docs.length,
                            options: CarouselOptions(
                              height: 220.0, // Adjust the height as needed
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return Column(
                                children: [
                                  Image.network(
                                    snapshots.data!.docs[index]['image_url'],
                                    fit: BoxFit.fill,
                                    width: 220,
                                    height: 180,
                                  ),
                                  Text(snapshots.data!.docs[index]['name'])
                                ],
                              );
                            },
                          ),
                        );
                      }

                  ),

                    // second silide ... code ...
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text('Comming up',
                            style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(width: 215),
                          Spacer(),
                          TextButton(onPressed : (){},child: Text('see all'))
                        ],
                      ),
                    )  ,
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount : imageurl2.length,itemBuilder: (context ,index){
                        return Padding(padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageurl1[index],
                              width: 100,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }
                      ),

                    ),

                    // third slide code..
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recently played',
                            style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          // Spacer(),
                          // InkWell(onTap: (){},child: Text('see all')),
                          TextButton(onPressed: (){}, child: Text("see all")),
                          // SizedBox(width: 20,)
                        ],
                      ),
                    )  ,
                    Container(
                      height: 130,
                      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount : imageurl2.length,itemBuilder: (context ,index){
                        return Padding(padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageurl2[index],
                              width: 80,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }
                      ),
                    ),
//BottomNavigationBar(items: )
                  ],
                ),
              )),
        ));
  }
}