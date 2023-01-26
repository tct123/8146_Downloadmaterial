
import 'package:flutter/material.dart';

// Die Bestellzustände
enum PizzaOrderStatus { none, ordered, delivered }

// Klein, aber fein, der BloC
class PizzaOrderBloC {
  // Der Status ist verfolgbar durch ValueNotifier
  final ValueNotifier<PizzaOrderStatus> currentStatus =
  ValueNotifier(PizzaOrderStatus.none);

  // Eine neue Bestellung aufgeben
  void onNewOrder() => currentStatus.value = PizzaOrderStatus.ordered;
}

class PizzaOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = PizzaOrderBloC();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pizza-Service'),
            const SizedBox(height: 8),
            ElevatedButton(
              // Die Funktion im BloC verwenden
              onPressed: bloc.onNewOrder,
              child: Text('Bestellung aufgeben'),
            ),
            const SizedBox(height: 16),

            // Bestellstatus
            ValueListenableBuilder<PizzaOrderStatus>(
                valueListenable: bloc.currentStatus,
                builder: (context, value, child) {
                  var orderStatus;
                  switch (value) {
                    case PizzaOrderStatus.none:
                      orderStatus = 'Keine Bestellung';
                      break;
                    case PizzaOrderStatus.ordered:
                      orderStatus = 'Bestellung entgegengenommen';
                      break;
                    case PizzaOrderStatus.delivered:
                      orderStatus = 'Guten Appetit!';
                      break;
                  }

                  return Text('Bestellstatus: $orderStatus');
                }
            ),
          ],
        ),
      ),
    );
  }
}
