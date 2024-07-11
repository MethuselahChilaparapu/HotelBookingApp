import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const BookingSuccessfulPage());
}

class BookingSuccessfulPage extends StatelessWidget {
  const BookingSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Successful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your booking was successful!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous screen
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        },
        child: const Icon(Icons.add),
    ),
    );
  }
}