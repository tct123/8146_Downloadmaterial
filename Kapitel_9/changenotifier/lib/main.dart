import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum PizzaOrderStatus { none, ready, ordered, delivered }

class PizzaOrderBloC extends ChangeNotifier {
  PizzaOrderStatus get currentStatus => _currentStatus;
  PizzaOrderStatus _currentStatus = PizzaOrderStatus.none;

  void onNewOrder() {
    _currentStatus = PizzaOrderStatus.ordered;
    notifyListeners();
  }
}

class PizzaOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider(
          create: (context) => PizzaOrderBloC(),
          child: Consumer<PizzaOrderBloC>(
              builder: (context, pizzaNotifier, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Pizza-Service'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: pizzaNotifier.onNewOrder,
                      child: Text('Bestellung aufgeben '),
                    ),
                    const SizedBox(height: 16),
                    Text('Bestellstatus: ${pizzaNotifier.currentStatus}'),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
