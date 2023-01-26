import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectivityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder<ConnectivityResult>(
              future: Connectivity().checkConnectivity(),
              builder: (context, snapshot) =>
                  Text('Verbindung: ${snapshot.data} %'),
            ),
            StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) => Text('Verbindung: ${snapshot.data}'),
            ),
          ],
        ),
      ),
    );
  }
}
