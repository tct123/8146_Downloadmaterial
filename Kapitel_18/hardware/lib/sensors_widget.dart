import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class SensorsWidget extends StatefulWidget {
  @override
  _SensorsWidgetState createState() => _SensorsWidgetState();
}

class _SensorsWidgetState extends State<SensorsWidget> {
  Battery battery;

  @override
  void initState() {
    super.initState();

    battery = Battery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<AccelerometerEvent>(
              stream: accelerometerEvents,
              builder: (context, snapshot) {
                return Text('Beschleunigungssensor: \n${snapshot.data}');
              },
            ),
            const SizedBox(height: 24),
            StreamBuilder<UserAccelerometerEvent>(
              stream: userAccelerometerEvents,
              builder: (context, snapshot) {
                return Text('Nutzer-Beschleunigungssensor: \n${snapshot.data}');
              },
            ),
            const SizedBox(height: 24),
            StreamBuilder<GyroscopeEvent>(
              stream: gyroscopeEvents,
              builder: (context, snapshot) {
                return Text('Gyroskop: ${snapshot.data}');
              },
            ),
            const SizedBox(height: 48),
            FutureBuilder<int>(
              future: battery.batteryLevel,
              builder: (context, snapshot) =>
                  Text('Batterieladung: ${snapshot.data} %'),
            ),
            StreamBuilder<BatteryState>(
              stream: battery.onBatteryStateChanged,
              builder: (context, snapshot) =>
                  Text('Batteriestatus: ${snapshot.data}'),
            ),
          ],
        ),
      ),
    );
  }
}
