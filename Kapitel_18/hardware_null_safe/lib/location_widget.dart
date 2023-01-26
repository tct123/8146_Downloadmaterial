import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Position>(
          future: Geolocator.isLocationServiceEnabled()
              .then(
                  (enabled) => enabled ? Geolocator.requestPermission() : null)
              .then((permission) =>
                  (permission ?? LocationPermission.denied) !=
                  LocationPermission.denied)
              .then(
                (canLocate) => canLocate
                    ? Geolocator.getCurrentPosition()
                    : (){ throw 'Fehler!'; }(),
              ),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Text('Da ist etwas schiefgelaufen!');
            }

            return Text(
              'Standort: ${snapshot.data!.latitude} latitude'
              ' ${snapshot.data!.longitude} longitude',
            );
          },
        ),
      ),
    );
  }
}
