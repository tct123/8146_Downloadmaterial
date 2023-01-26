
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: DialogExamples())));
}

class DialogExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('Content'),
                    title: Text('Title'),
                    actions: [
                      TextButton(onPressed: () {}, child: Text('Left')),
                      TextButton(onPressed: () {}, child: Text('Right')),
                    ],
                  ),
                );
              },
              child: Text('AlertDialog'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text('Title'),
                    children: [
                      SimpleDialogOption(
                        child: Text('Option 1'),
                        onPressed: () {},
                      ),
                      SimpleDialogOption(
                        child: Text('Option 2'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
              child: Text('SimpleDialog'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    content: Text('Content'),
                    title: Text('Title'),
                    actions: [
                      TextButton(onPressed: () {}, child: Text('Left')),
                      TextButton(onPressed: () {}, child: Text('Right')),
                    ],
                  ),
                );
              },
              child: Text('CupertinoAlertDialog'),
            ),
          ],
        ));
  }
}


class SnackBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Zeige Snackbar'),
          onPressed: () {
            final snackbar = SnackBar(
              content: Text('Hallo!'),
              action: SnackBarAction(onPressed: () {}, label: 'Aktion',),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
        ),
      ),
    );
  }
}
