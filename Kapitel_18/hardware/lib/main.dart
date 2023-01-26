import 'package:flutter/material.dart';

import 'camera_widget.dart';
import 'connectivity_widget.dart';
import 'device_info_widget.dart';
import 'location_widget.dart';
import 'sensors_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Gallery()),
    );
  }
}

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SensorsWidget()),
              );
            },
            child: Text('Sensoren'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ConnectivityWidget()),
              );
            },
            child: Text('Connectivity'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DeviceInfoWidget()),
              );
            },
            child: Text('Device Info'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CameraWidget()),
              );
            },
            child: Text('Kamera und Bibliothek'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LocationWidget()),
              );
            },
            child: Text('Position'),
          ),
        ],
      ),
    );
  }
}
