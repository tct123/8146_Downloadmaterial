import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TimeInfoWidget(child: MaterialApp(home: StartPage()));
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Startseite'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => TimeInfo.of(context).updater?.call(),
              child: Text('Aktualisieren'),
            ),
            const SizedBox(height: 16),
            Text(TimeInfo.of(context).lastUpdatedTime ?? ''),
          ],
        ),
      ),
    );
  }
}

class TimeInfoWidget extends StatefulWidget {
  const TimeInfoWidget({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _TimeInfoWidgetState createState() => _TimeInfoWidgetState();
}

class _TimeInfoWidgetState extends State<TimeInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return TimeInfo(
      lastUpdatedTime: DateTime.now().toIso8601String(),
      updater: () => setState(() {}),
      child: widget.child,
    );
  }
}

class TimeInfo extends InheritedWidget {
  TimeInfo({this.lastUpdatedTime, this.updater, Widget child})
    : super(child: child);

  final String lastUpdatedTime;
  final VoidCallback updater;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static TimeInfo of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TimeInfo>();
  }
}
