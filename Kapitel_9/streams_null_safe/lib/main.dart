import 'dart:async';

import 'package:flutter/material.dart';

enum PizzaOrderStatus { none, ready, ordered, delivered }

class PizzaOrderBloC {
  final StreamController<PizzaOrderStatus> _orderStatusController =
  StreamController<PizzaOrderStatus>();

  Stream<PizzaOrderStatus> get orderChanges => _orderStatusController.stream;

  void onNewOrder() =>
      _orderStatusController.sink.add(PizzaOrderStatus.ordered);

  void dispose() {
    _orderStatusController.close();
  }
}

class PizzaOrderWidget extends StatefulWidget {
  @override
  _PizzaOrderWidgetState createState() => _PizzaOrderWidgetState();
}

class _PizzaOrderWidgetState extends State<PizzaOrderWidget> {
  // bloc in der Klasse verfügbar machen
  late PizzaOrderBloC _bloc;

  @override
  void initState() {
    super.initState();
    // Der BloC soll nur einmal initialisiert werden.
    // In einem StatefulWidget könnte build aber sehr oft
    // ausgeführt werden.
    _bloc = PizzaOrderBloC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<PizzaOrderStatus>(
          stream: _bloc.orderChanges,
          builder: (context, streamSnapshot) {
            print(streamSnapshot.data);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Pizza-Service'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _bloc.onNewOrder,
                  child: Text('Bestellung aufgeben'),
                ),
                const SizedBox(height: 16),
                Text('Bestellstatus: ${streamSnapshot.data}'),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Wird aufgerufen, wenn das Widget vom Garbage Collector
    // bearbeitet wird
    _bloc.dispose();

    super.dispose();
  }
}
