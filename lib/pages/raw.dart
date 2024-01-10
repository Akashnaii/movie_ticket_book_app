// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [BottomNavigationBar].
//
// void main() => runApp(const BottomNavigationBarExampleApp());
//
// class BottomNavigationBarExampleApp extends StatelessWidget {
//   const BottomNavigationBarExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: BottomNavigationBarExample(),
//     );
//   }
// }
//
// class BottomNavigationBarExample extends StatefulWidget {
//   const BottomNavigationBarExample({super.key});
//
//   @override
//   State<BottomNavigationBarExample> createState() =>
//       _BottomNavigationBarExampleState();
// }
//
// class _BottomNavigationBarExampleState
//     extends State<BottomNavigationBarExample> {
//   int _selectedIndex = 0;
//   final ScrollController _homeController = ScrollController();
//
//   Widget _listViewBody() {
//     return ListView.separated(
//         controller: _homeController,
//         itemBuilder: (BuildContext context, int index) {
//           return Center(
//             child: Text(
//               'Item $index',
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) => const Divider(
//           thickness: 1,
//         ),
//         itemCount: 50);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: _listViewBody(),
//       bottomNavigationBar: ,
//     );
//   }
//
//   void showModal(BuildContext context) {
//     showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: const Text('Example Dialog'),
//         actions: <TextButton>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Close'),
//           )
//         ],
//       ),
//     );
//   }
// }
