import 'package:flutter/material.dart';
// Importieren der generierten Lokalisierung für die Klasse S
import 'package:localization_mit_intl_plugin/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // das von Flutter Intl bereitgestellte Delegate
        S.delegate,
      ],
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              return Center(
                child: Text(
                  S.of(context).greeting,
                ),
              );
            }),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // S.load ist vom BuildContext unabhängig,
                // es wird kein Builder benötigt
                S.load(Locale(isEnglish ? 'de' : 'en'));
                setState(() => isEnglish = !isEnglish);
              },
              child: Text('Sprache wechseln'),
            )
          ],
        ),

      ),
    );
  }
}
