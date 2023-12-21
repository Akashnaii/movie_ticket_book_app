import 'package:flutter/material.dart';


class Seatselect extends StatefulWidget {
  const Seatselect({super.key});

  @override
  State<Seatselect> createState() => _SeatselectState();
}

class _SeatselectState extends State<Seatselect> {

  List<List<bool>> selectedSeats = List.generate(
      8, (row) => List.generate(8, (column) => false)); // 8x8 seat grid

  Map<String, double> seatPrices = {
    'A1': 10.0,
    'B2': 8.0,
    'C3': 12.0,
    // Add more seat prices as needed
  };

  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Seat Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your seats:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            buildSeatGrid(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle seat selection logic
                List<String> selectedSeatNumbers = getSelectedSeats();
                double total = calculateTotalPrice(selectedSeatNumbers);
                setState(() {
                  totalPrice = total;
                });
                print('Selected Seats: $selectedSeatNumbers');
              },
              child: Text('pay - \$${totalPrice.toStringAsFixed(2)}'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
            )),
          ],
        ),
      ),
    );
  }

  Widget buildSeatGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: List.generate(
          8,
              (row) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              8,
                  (column) => GestureDetector(
                onTap: () {
                  // Toggle seat selection
                  setState(() {
                    selectedSeats[row][column] = !selectedSeats[row][column];
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: selectedSeats[row][column]
                        ? Colors.green
                        : Colors.grey,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      '${String.fromCharCode(row + 65)}${column + 1}',
                      style: TextStyle(
                        color: selectedSeats[row][column]
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> getSelectedSeats() {
    List<String> result = [];
    for (int i = 0; i < selectedSeats.length; i++) {
      for (int j = 0; j < selectedSeats[i].length; j++) {
        if (selectedSeats[i][j]) {
          result.add('${String.fromCharCode(i + 65)}${j + 1}');
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


