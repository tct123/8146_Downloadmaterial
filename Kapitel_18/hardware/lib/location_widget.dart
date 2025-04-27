// ignore_for_file: cast_from_null_always_fails

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Position>(
          future: Geolocator.isLocationServiceEnabled()
              .then((enabled) => enabled
                  ? Geolocator.requestPermission()
                  : null as FutureOr<LocationPermission> Function(bool value))
              .then((permission) => (permission) != LocationPermission.denied)
              .then((canLocate) =>
                  canLocate ? Geolocator.getCurrentPosition() : null),
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
