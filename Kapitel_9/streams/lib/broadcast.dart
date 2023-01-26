import 'dart:async';

import 'package:flutter/material.dart';

enum PizzaOrderStatus { none, ready, ordered, delivered }

class PizzaOrderBloC {
  // Wir benutzen den Konstruktor StreamController.broadcast
  final StreamController<PizzaOrderStatus> _orderStatusController =
      StreamController<PizzaOrderStatus>.broadcast();

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
  PizzaOrderBloC _bloc;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _bloc.onNewOrder,
              child: Text('Bestellung aufgeben '),
            ),
            StreamBuilder(
              stream: _bloc.orderChanges,
              builder: (context, snapshot) =>
                  Text('Einmal der Bestellstatus: ${snapshot.data}'),
            ),
            StreamBuilder(
              stream: _bloc.orderChanges,
              builder: (context, snapshot) =>
                  Text('Nochmal der Bestellstatus: ${snapshot.data}'),
            ),
          ],
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
