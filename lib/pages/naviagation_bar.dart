import 'package:flutter/material.dart';
import 'package:moviemate/pages/home_p.dart';


class nav extends StatefulWidget {
  const nav({super.key});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void ontapp(int index){
    setState(() {
      selectedIndex =  index;
      pageController.jumpToPage(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: PageView(
          controller: pageController,
          children: [
            home_p(),

          ],
        ),
bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.settings ), label: 'Setting'),
],
currentIndex: selectedIndex,
  selectedItemColor: Colors.green,
  unselectedItemColor: Colors.grey,
  onTap: ontapp,
),

      ),
    );
  }
}
