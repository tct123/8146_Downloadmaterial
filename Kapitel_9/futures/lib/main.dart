// Ein neuer Zustand: ready
import 'package:flutter/material.dart';

enum PizzaOrderStatus { none, ready, ordered, delivered }

class PizzaOrderBloC {
  PizzaOrderStatus get currentStatus => _currentStatus;
  PizzaOrderStatus _currentStatus = PizzaOrderStatus.none;

  // Asynchrone Methode
  Future<PizzaOrderStatus> makeReadyForOrders() async {
    // Warte fünf Sekunden, dann setze den Status
    // und beende das zurückgegebene Future über return
    await Future.delayed(Duration(seconds: 5));
    _currentStatus = PizzaOrderStatus.ready;

    return _currentStatus;
  }
}

class PizzaOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = PizzaOrderBloC();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: bloc.makeReadyForOrders(),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pizza-Service'),
                  const SizedBox(height: 16),
                  Text('Bestellstatus: ${snapshot.data ?? 'Bitte warten'}'),
                ],
              );
            }
        ),
      ),
    );
  }
}
