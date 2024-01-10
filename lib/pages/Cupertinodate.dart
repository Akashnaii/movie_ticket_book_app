import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();

    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var dateTime;
    return Scaffold(
        appBar: AppBar(
          title: const Text("DATE PICKER"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Date Picker",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Text(
                dateTime != null ? "DateTime:$dateTime" : 'select DateTime',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      // var AppColor;
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Done"),
                            ),
                            Expanded(
                              child: CupertinoDatePicker(
                                initialDateTime: dateTime,
                                mode: CupertinoDatePickerMode.date,
                                minimumDate: DateTime(2000),
                                maximumDate: DateTime.now().add(
                                  const Duration(days: 2 * 365),
                                ),
                                use24hFormat: true,
                                onDateTimeChanged: (date) {
                                  setState(() {
                                    dateTime = date;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text("Date Picker"),
              ),
            ],
          ),
        ));
  }
}
