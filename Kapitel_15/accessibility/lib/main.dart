import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: SimpleSemanticsExample())));
}

class SimpleSemanticsExample extends StatelessWidget {
  const SimpleSemanticsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: true,
      home: Scaffold(
        body: Center(
          child: Semantics(
            label: 'Eine grüne Box',
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class MergeSemanticsExample extends StatelessWidget {
  const MergeSemanticsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: true,
      home: Scaffold(
        body: Center(
          child: MergeSemantics(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 3'),
                Text('Text 4'),
                Text('Text 5'),
                Text('Text 6'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExcludeSemanticsExample extends StatelessWidget {
  const ExcludeSemanticsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: true,
      home: Scaffold(
        body: Center(
          child: ExcludeSemantics(
            excluding: false,
            child: Semantics(
              label: 'Eine grüne Box',
              child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IndexedSemanticsExample extends StatelessWidget {
  const IndexedSemanticsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // automatisches Ummanteln deaktivieren
      addSemanticIndexes: false,
      children: [
        // Element soll vorgelesen werden
        IndexedSemantics(
          index: 0,
          child: Text(
            'Es sind 10 °C',
            semanticsLabel: 'Die Temperatur beträgt zehn Grad Celsius',
          ),
        ),
        // Kein IndexedSemantics, ignorieren
        Image.network(
          'https://flutter.dev/images/flutter-mono-81x100.png',
          semanticLabel: 'Ein hübsch anzusehendes Bild',
        ),
        // Kein IndexedSemantics, ignorieren
        Icon(
          Icons.group,
          semanticLabel: 'Icon-Gruppe',
        ),
        // Element soll vorgelesen werden
        IndexedSemantics(
          index: 1,
          child: Text(
            'Der nächste Bericht',
          ),
        ),
      ],
    );
  }
}

class BlockedSemanticsExample extends StatelessWidget {
  const BlockedSemanticsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Nicht vorlesen bitte'),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text('Auch nicht vorlesen'),
        ),
        BlockSemantics(),
        Align(
          alignment: Alignment.center,
          child: Text('Vorlesen'),
        ),
      ],
    );
  }
}
