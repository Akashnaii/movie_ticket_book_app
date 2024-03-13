import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviemate/pages/seat_selection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  class Theater extends StatefulWidget {
    final String movieName;
    final String imageUrl;

    const Theater({Key? key, required this.movieName, required this.imageUrl}) : super(key: key);

    @override
    State<Theater> createState() => _TheaterState();
  }

  class _TheaterState extends State<Theater> {
    final title = FirebaseFirestore.instance.collection('movies').snapshots();
    final firestore = FirebaseFirestore.instance.collection('theater').snapshots();

    DateTime _selectedDate = DateTime.now();
    DateTime _minDate = DateTime.now(); // Example minimum date
    DateTime _maxDate = DateTime.now().add(Duration(days: 9)); // Example maximum date


    @override
    void initState(){
      super.initState();
      _selectedDate = DateTime.now();
        _minDate = DateTime.now();
      _maxDate = DateTime.now().add(const Duration(days: 10));
    }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.black,
          title: const Text(
            'Theatres',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: EasyInfiniteDateTimeLine(
                  firstDate: DateTime.now(),
                  focusDate: _selectedDate,
                  lastDate: DateTime.now().add(const Duration(days: 7)),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  },

                  activeColor: const Color(0xFF6CD95B),

                  dayProps: const EasyDayProps(
                    height: 56.0,
                    width: 56.0,
                    dayStructure: DayStructure.dayNumDayStr,
                    inactiveDayStyle: DayStyle(
                      borderRadius: 48.0,
                      dayNumStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    activeDayStyle: DayStyle(
                      dayNumStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: firestore,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshots.hasError) {
                    return const Text('Some error is occurring');
                  }
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        // debugPrint("snapshots.data!.docs[index]:${snapshots.data!.docs[index]['name']}");
                        List<dynamic> showTime = snapshots.data?.docs[index]['showtime'];
                        String name = snapshots.data?.docs[index]['name'];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFFFFFFF),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: Text(
                                        snapshots.data!.docs[index]['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          context: context,
                                          builder: (context) => SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Name : ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.7,
                                                        child: Text(
                                                          '${snapshots.data!.docs[index]['name']}',
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Address : ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w300,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        child: Text(
                                                          '${snapshots.data!.docs[index]['address']}',
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.location_on),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  children: List.generate(
                                    showTime.length,
                                        (index) => Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: InkWell(
                                        onTap: () {
                                          debugPrint("name:${name}");
                                          debugPrint("name12:${snapshots.data?.docs[index]['showtime'][index]}");
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) => SeatSelection(
                                                theaterName: name,
                                                showtime: snapshots.data?.docs[index]['showtime'][index] ?? '',
                                                movieName: widget.movieName,
                                                imageUrl: widget.imageUrl, selectedDate: _selectedDate.toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            // "123",
                                            showTime[index],
                                            style: TextStyle(color: Color(0xFF4BB33B)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      );
    }
  }
