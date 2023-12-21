import 'package:flutter/material.dart';
import 'package:moviemate/category/grid_2.dart';
import 'package:moviemate/category/grid_3.dart';
import 'package:moviemate/category/1_gridv.dart';

class trending extends StatefulWidget {
  const trending({super.key});

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Category Movie'),
          backgroundColor: Colors.blueGrey,
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 55,
                  color: Colors.white54,
                  child: TabBar(
                    //physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 5, right: 20, left: 20),
                    unselectedLabelColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pinkAccent,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color : Colors.pinkAccent, width: 1),
                            //color: Colors.pinkAccent
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Hindi'),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color : Colors.pinkAccent, width: 1),
                            // color: Colors.pinkAccent
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('English'),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color : Colors.pinkAccent, width: 1),
                            // color: Colors.pinkAccent
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('South'),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //expanded widget use on tabbarview continue to code ...
              Expanded(
                child: TabBarView(
                  children: [
                    grid_1(),
                    grrid_2(),
                    grrid_3(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
