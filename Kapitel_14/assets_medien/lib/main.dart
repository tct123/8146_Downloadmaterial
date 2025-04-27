import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: '<Name>',
        iconTheme: IconThemeData(
          color: Colors.red,
          opacity: 0.4,
          size: 36,
        ),
      ),
      home: Scaffold(body: Images()),
    );
  }
}

class Images extends StatelessWidget {
  void readJson(BuildContext context) async {
    final jsonReadout = await DefaultAssetBundle.of(context).loadStructuredData(
      'text/inhalt.json',
      (value) {
        try {
          final decoded = json.decode(value);
          return Future.value(decoded);
        } catch (e) {
          return SynchronousFuture('');
        }
      },
    );

    print(jsonReadout);
  }

  @override
  Widget build(BuildContext context) {
    readJson(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/logo.png'),
          Image.network('https://flutter.dev/images/flutter-mono-81x100.png'),
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Another(), maintainState: false)),
            child: Text(
              'Ein Text',
              style: TextStyle(fontFamily: '<Name'),
            ),
          ),
          CachedNetworkImage(
            imageUrl: 'https://flutter.dev/images/flutter-mono-81x100.png',
          ),
          CachedNetworkImage(
            imageUrl: 'https://flutter.dev/images/flutter-mono-81x100.png',
            errorWidget: (context, url, error) =>
                Text('Problem bei $url: $error'),
            imageBuilder: (context, imageProvider) => GestureDetector(
              child: Image(image: imageProvider),
              onTap: () {
                // etwas ausführen
              },
            ),
          ),
          const SizedBox(height: 12),
          Icon(
            Icons.email,
            color: Colors.green,
            size: 36,
          ),
          Icon(
            CupertinoIcons.mail,
            color: CupertinoColors.activeBlue,
            size: 36,
          ),
          IconButton(
            icon: Icon(
              Icons.email,
              color: Colors.green,
              size: 36,
            ),
            onPressed: () {},
          ),
          ImageIcon(
            AssetImage('images/logo.png'),
            size: 36,
            color: Colors.green,
          ),
          IconTheme(
            data: IconThemeData(color: Colors.red),
            child: Icon(Icons.call),
          ),

          // Beispiel: Ein SVG einbinden
          // SvgPicture.asset('Pfad/zur/Datei.svg'),

          // Beispiel: Ein Image über Datei
          // Image.file(File('folder/file')),

          // Beispiel: Builder mit Dekodierung von Images
          // Builder(builder: (context) {
          //   final base64 = '';
          //   try {
          //     final decodedImage = base64Decode(base64);
          //     final image = Image.memory(decodedImage);
          //     return image;
          //   } catch (e) {
          //     // Den Fehler behandeln
          //     print(e);
          //     // Einen Platzhalter anzeigen
          //     return Placeholder();
          //   }
          // }),
        ],
      ),
    );
  }
}

class Another extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Back'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
