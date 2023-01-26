import 'package:flutter/material.dart';

import 'dart:io' as io;
import 'android_to_flutter.dart';
import 'ios_to_flutter.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: io.Platform.isAndroid
            ? AndroidToFlutterWidget()
            : IOSToFlutterWidget(),
      ),
    );
  }
}
