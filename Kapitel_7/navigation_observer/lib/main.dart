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
      // Die List der Observer, hier nur ein AppNavigatorObserver
      navigatorObservers: [AppNavigatorObserver()],
    );
  }
}

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}

  @override
  void didStartUserGesture(
      Route<dynamic>? route, Route<dynamic>? previousRoute) {}

  @override
  void didStopUserGesture() {}
}


class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seite A'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('C');
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seite B'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
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
