import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PizzaOrderWidget(),
    );
  }
}

class PizzaOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pizza-Service'),
            const SizedBox(height: 8),
            ElevatedButton(
              // Hier soll die Bestellung initiiert werden
              onPressed: () {},
              child: Text('Bestellung aufgeben'),
            ),
            const SizedBox(height: 16),
            // Der Bestellstatus ist noch fest hinterlegt
            Text('Bestellstatus'),
          ],
        ),
      ),
    );
  }
}
