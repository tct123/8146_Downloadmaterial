import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class DeviceInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // ...
    }

    return Scaffold(
      body: Center(
        child: FutureBuilder<AndroidDeviceInfo>(
          future: info.androidInfo,
          builder: (context, snapshot) {
            return ListView(
              children: [
                Text(snapshot.data!.androidId),
                Text(snapshot.data!.brand),
                Text(snapshot.data!.display),
                Text(snapshot.data!.model),
                Text(snapshot.data!.systemFeatures.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
