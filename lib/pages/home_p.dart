import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviemate/Navigationbar/Settingscreen.dart';
import 'package:moviemate/pages/booking_history.dart';
import 'package:moviemate/pages/discription.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  int _selectedIndex = 0;
  int _previousIndex = 0;
  final firestore = FirebaseFirestore.instance.collection('movies').snapshots();
  final concert = FirebaseFirestore.instance.collection('Concert').snapshots();
  final standupcomedy = FirebaseFirestore.instance.collection('Standup commedy').snapshots();
  int _backButtonPressCount = 0;

  Future<bool> _handleBackPressed() async {
    if (_backButtonPressCount == 1) {
      SystemNavigator.pop();
      return true;
    } else {
      final snackBar = SnackBar(
        content: Text('Press back again to exit',
        ),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _backButtonPressCount++;
      Future.delayed(const Duration(seconds: 2), () {
        _backButtonPressCount = 0;
      });
      return false;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 2,
              backgroundColor: Colors.white,
              title: const Text(
                'MOVIEMATE',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'Trending',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: firestore,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        if (snapshots.hasError)
                          return const Text('some error is occuring');
                        return Container(
                          height: 210,
                          child: CarouselSlider.builder(
                            itemCount: snapshots.data!.docs.length,
                            options: CarouselOptions(
                              height: 220.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => DescriptionPage(snapshot: snapshots.data!.docs[index])));
                                    },
                                    child: Image.network(
                                      snapshots.data!.docs[index]['image_url'],
                                      fit: BoxFit.fill,
                                      width: 220,
                                      height: 180,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Text(
                            'Coming up',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: firestore,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: const CircularProgressIndicator(),
                          );
                        }
                        if (snapshots.hasError) {
                          return Text('Error: ${snapshots.error}');
                        }
                        if (snapshots.data == null &&
                            snapshots.data!.docs.isEmpty) {
                          return Text('No data available');
                        }
                        if (snapshots.data == null) {
                          // Handle null case
                          return Text('Data is null');
                        }
      
                        return Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => DescriptionPage(snapshot: snapshots.data!.docs[index])));
                                    },
                                    child: Image.network(
                                      snapshots.data!.docs[index]['image_url'],
                                      fit: BoxFit.fill,
                                      // ,
                                      width: 100,
                                      height: 80,
      
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Text(
                            'Concert',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: concert,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: const CircularProgressIndicator(),
                          );
                        }
                        if (snapshots.hasError) {
                          return Text('Error: ${snapshots.error}');
                        }
                        if (snapshots.data == null ||
                            snapshots.data!.docs.isEmpty) {
                          return Text('No data available');
                        }
                        if (snapshots.data == null) {
                          // Handle null case
                          return Text('Data is null');
                        }
      
                        return Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => DescriptionPage(snapshot: snapshots.data!.docs[index])));
                                    },
                                    child: Image.network(
                                      snapshots.data!.docs[index]['image_url'],
                                      width: 100,
                                      height: 80,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Text(
                            'Stand-Up Comedy',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: standupcomedy,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: const CircularProgressIndicator(),
                          );
                        }
                        if (snapshots.hasError) {
                          return Text('Error: ${snapshots.error}');
                        }
                        if (snapshots.data == null ||
                            snapshots.data!.docs.isEmpty) {
                          return Text('No data available');
                        }
                        if (snapshots.data == null) {
                          // Handle null case
                          return Text('Data is null');
                        }
      
                        return Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => DescriptionPage(snapshot: snapshots.data!.docs[index])));
                                    },
                                    child: Image.network(
                                      snapshots.data!.docs[index]['image_url'],
                                      width: 100,
                                      height: 80,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history_sharp,
                  ),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              onTap: (int index) {
                if (index != _selectedIndex){
                  if (index != _previousIndex){
                    Navigator.pop(context);
                  }
                switch (index) {
                  case 0:
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => HomeP()));
                    break;

                  case 1:
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => BookingHistory(),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => SettingScreen()));
                    break;
                }
                }
                else {
                  setState(() {
                    _selectedIndex = index;
                    _previousIndex = index;
                  });
                }
              }
           ),
          ),
        ),
      ),
  );
  }
}

