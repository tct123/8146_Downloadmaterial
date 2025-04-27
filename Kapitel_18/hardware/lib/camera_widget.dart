import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Uint8List>(
        future: ImagePicker()
            .getImage(source: ImageSource.camera)
            .then((picture) => picture!.readAsBytes()),
        builder: (context, snapshot) {
          if (snapshot.hasData == false || snapshot.data!.isEmpty) {
            return Text('Kein Bild ausgewählt');
          }

          return Image.memory(snapshot.data);
        },
      ),
    );
  }

  void checkPermission() async {
    if (await Permission.camera.isGranted) {
      // ...
    }

    PermissionStatus result = await Permission.camera.request();
    switch (result) {
      case PermissionStatus.denied:
        // abgelehnt
        break;
      case PermissionStatus.granted:
        // erteilt
        break;
      case PermissionStatus.restricted:
        // kann gerade nicht verändert werden
        break;
      case PermissionStatus.limited:
        // eingeschränkt
        break;
      case PermissionStatus.permanentlyDenied:
        // der Nutzer möchte nicht wieder gefragt werden
        break;
      case PermissionStatus.provisional:
        // TODO: Handle this case.
        break;
    }
  }
}
