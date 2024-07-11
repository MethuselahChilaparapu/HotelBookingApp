import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'bookingsuccessful.dart';

void main() {
  runApp(const HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HotelBookingPage(),
    );
  }
}

class HotelBookingPage extends StatefulWidget {
  const HotelBookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 1)); // Default to next day
  int _selectedRoom = 0; // Index of selected room
  final List<String> _rooms = ['Single Room', 'Double Room', 'Suite']; // Room options

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _bookRoom() {
    // Here you can implement the booking logic, e.g., send data to backend
    // For demonstration, we'll print the selected dates and room
    if (kDebugMode) {
      print('Booked Room: ${_rooms[_selectedRoom]}');
    }
    if (kDebugMode) {
      print('Dates: ${DateFormat('yyyy-MM-dd').format(_startDate)} to ${DateFormat('yyyy-MM-dd').format(_endDate)}');
    }
    // Add your own logic for handling the booking process
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Dates:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Check-in:'),
                      TextButton(
                        onPressed: () => _selectDate(context, true),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(_startDate),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Check-out:'),
                      TextButton(
                        onPressed: () => _selectDate(context, false),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(_endDate),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Select Room:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            DropdownButtonFormField<int>(
              value: _selectedRoom,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedRoom = newValue!;
                });
              },
              items: _rooms.map((String room) {
                return DropdownMenuItem<int>(
                  value: _rooms.indexOf(room),
                  child: Text(room),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: _bookRoom,
                child: const Text('Book Room'),
              ),
            ),
          ],
        ),
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookingSuccessfulPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}