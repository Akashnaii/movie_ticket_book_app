import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Creditcard.dart';

class SeatSelection extends StatefulWidget {
  final String? theaterName;
  final String? showtime;
  final String movieName;
  final String imageUrl;

  const SeatSelection({
    Key? key,
    this.theaterName,
    this.showtime,
    required this.movieName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<SeatSelection> createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  List<List<bool>> selectedSeatsA = List.generate(
    4,
        (row) => List.generate(4, (column) => false),
  );

  List<List<bool>> selectedSeatsA1 = List.generate(
    4,
        (row) => List.generate(4, (column) => false),
  );

  List<List<bool>> selectedSeatsB = List.generate(
    4,
        (row) => List.generate(4, (column) => false),
  );

  List<List<bool>> selectedSeatsB1 = List.generate(
    4,
        (row) => List.generate(4, (column) => false),
  );

  List<List<bool>> selectedSeatsC = List.generate(
    4,
        (row) => List.generate(4, (column) => false),
  );

  List<List<bool>> selectedSeatsC1 = List.generate(
    4,
        (row) => List.generate(4, (column) => false),
  );

  Map<String, double> seatPrices = {
    'A1': 500, 'A2': 500, 'A3': 500, 'A4': 500, 'A5': 500, 'A6': 500, 'A7': 500,
    'A8': 500,
    'B1': 400, 'B2': 400, 'B3': 400, 'B4': 400, 'B5': 400, 'B6': 400, 'B7': 400,
    'B8': 400,
    'C1': 400, 'C2': 400, 'C3': 400, 'C4': 400, 'C5': 400, 'C6': 400, 'C7': 400,
    'C8': 400,
    'D1': 400, 'D2': 400, 'D3': 400, 'D4': 400, 'D5': 400, 'D6': 400, 'D7': 400,
    'D8': 400,
    'E1': 300, 'E2': 300, 'E3': 300, 'E4': 300, 'E5': 300, 'E6': 300, 'E7': 300,
    'E8': 300,
    'F1': 300, 'F2': 300, 'F3': 300, 'F4': 300, 'F5': 300, 'F6': 300, 'F7': 300,
    'F8': 300,
    'G1': 300, 'G2': 300, 'G3': 300, 'G4': 300, 'G5': 300, 'G6': 300, 'G7': 300,
    'G8': 300,
    'H1': 300, 'H2': 300, 'H3': 300, 'H4': 300, 'H5': 300, 'H6': 300, 'H7': 300,
    'H8': 300,
  };

  StreamController<double> totalPriceController = StreamController<double>();

  @override
  void dispose() {
    totalPriceController.close();
    super.dispose();
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
        backgroundColor: Colors.black,
        title: Text(
          'Book your seats',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            'Price [ A ]',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '500/-',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSeatGridA(),
                buildSeatGridA1(),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Price[ B,C,D ]',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            '400/-',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSeatGridB(),
                buildSeatGridB2(),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Price[ E,F,G,H ]',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            '300/-',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSeatGridC(),
                buildSeatGridC3(),
              ],
            ),
          ),
          SizedBox(height: 20),
          StreamBuilder<double>(
            stream: totalPriceController.stream,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: () {
                  List<String> selectedSeatNumbers = getSelectedSeats();
                  double total = calculateTotalPrice(selectedSeatNumbers);
                  totalPriceController.add(total);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CreditCardScreen(
                        theaterName: widget.theaterName,
                        showtime: widget.showtime,
                        selectedSeats: selectedSeatNumbers,
                        totalPrice: total,
                        movieName: widget.movieName,
                        imageUrl: widget.imageUrl,
                      ),
                    ),
                  );
                  print('Selected Seats: $selectedSeatNumbers');
                },
                child: Text(
                  'Pay - \₹ ${snapshot.data?.toStringAsFixed(2) ?? "0.00"}',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSeatGridA() {
    return Column(
      children: List.generate(
        1,
            (row) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
                (column) => GestureDetector(
              onTap: () {
                toggleSeatSelection(row, column, selectedSeatsA, context);
              },
              child: buildSeatContainer(selectedSeatsA[row][column], row, column),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatGridA1() {
    return Column(
      children: List.generate(
        1,
            (row) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
                (column) => GestureDetector(
              onTap: () {
                toggleSeatSelection(row, column, selectedSeatsA1, context);
              },
              child: buildSeatContainer(selectedSeatsA1[row][column], row, column + 4),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatGridB() {
    return Column(
      children: List.generate(
        3,
            (row) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
                (column) => GestureDetector(
              onTap: () {
                toggleSeatSelection(row, column, selectedSeatsB, context);
              },
              child: buildSeatContainer(selectedSeatsB[row][column], row + 1, column),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatGridB2() {
    return Column(
      children: List.generate(
        3,
            (row) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
                (column) => GestureDetector(
              onTap: () {
                toggleSeatSelection(row, column, selectedSeatsB1, context);
              },
              child: buildSeatContainer(selectedSeatsB1[row][column], row + 1, column + 4),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatGridC() {
    return Column(
      children: List.generate(
        4,
            (row) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
                (column) => GestureDetector(
              onTap: () {
                toggleSeatSelection(row, column, selectedSeatsC, context);
              },
              child: buildSeatContainer(selectedSeatsC[row][column], row + 4, column),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatGridC3() {
    return Column(
      children: List.generate(
        4,
            (row) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            4,
                (column) => GestureDetector(
              onTap: () {
                toggleSeatSelection(row, column, selectedSeatsC1, context);
              },
              child: buildSeatContainer(selectedSeatsC1[row][column], row + 4, column + 4),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatContainer(bool isSelected, int row, int column) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${String.fromCharCode(row + 65)}${column + 1}',
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  void toggleSeatSelection(
      int row, int column, List<List<bool>> selectedSeats, BuildContext context) {
    setState(() {
      if (selectedSeats[row][column]) {
        selectedSeats[row][column] = false;
      } else {
        if (getSelectedSeats().length < 10) {
          selectedSeats[row][column] = !selectedSeats[row][column];

          // Calculate total price and update the stream
          List<String> selectedSeatNumbers = getSelectedSeats();
          double total = calculateTotalPrice(selectedSeatNumbers);
          totalPriceController.add(total);
        } else {
          // Show a message using a dialog box to notify the user that the limit is reached
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Seat Selection Limit'),
                content: Text('Maximum 10 seats can be selected.'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    });
  }

  List<String> getSelectedSeats() {
    List<String> result = [];
    result.addAll(getSelectedSeatsFromGrid(selectedSeatsA, 65));
    result.addAll(getSelectedSeatsFromGrid(selectedSeatsA1, 65));
    result.addAll(getSelectedSeatsFromGrid(selectedSeatsB, 66));
    result.addAll(getSelectedSeatsFromGrid(selectedSeatsB1, 66));
    result.addAll(getSelectedSeatsFromGrid(selectedSeatsC, 69));
    result.addAll(getSelectedSeatsFromGrid(selectedSeatsC1, 69));
    return result;
  }

  List<String> getSelectedSeatsFromGrid(
      List<List<bool>> grid, int startingCharCode) {
    List<String> result = [];
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j]) {
          result.add('${String.fromCharCode(i + startingCharCode)}${j + 1}');
        }
      }
    }
    return result;
  }

  double calculateTotalPrice(List<String> selectedSeats) {
    double total = 0.0;
    for (String seat in selectedSeats) {
      if (seatPrices.containsKey(seat)) {
        total += seatPrices[seat]!;
      }
    }
    return total;
  }
}
