import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'A',
      routes: {
        'A': (context) => PageA(),
        'B': (context) => PageB(),
        'C': (context) => PageC(),
      },
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final from = ModalRoute.of(context)?.settings.arguments;
    print(from);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seite A'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('C', arguments: 'Von A');
              },
              // Der Text wird für das neue Ziel geändert
              child: Text('Vorwärts zu C'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final from = ModalRoute.of(context)?.settings.arguments;
    print(from);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seite B'),
            ElevatedButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop('Komme von B');
                }
              },
              child: Text('Zurück zu A'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Den Navigationsparameter abrufen
    final from = ModalRoute.of(context)?.settings.arguments;
    print(from);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seite C'),
            ElevatedButton(
              onPressed: () {
                // C durch B ersetzen
                Navigator.of(context).pushReplacementNamed('B');
              },
              child: Text('Austauschen mit B'),
            ),
          ],
        ),
      ),
    );
  }
}
