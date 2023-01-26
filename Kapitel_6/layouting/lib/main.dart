import 'package:flutter/material.dart';

import 'mediaquery.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: NavigateWidget())));
}
class NavigateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Klick'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Detail'),
                ),
                body: MediaQueryExample(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}