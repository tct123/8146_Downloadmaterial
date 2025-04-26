import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

class LoginMask extends StatefulWidget {
  @override
  // Aufruf des State-Konstruktors
  _LoginMaskState createState() => _LoginMaskState();
}

class _LoginMaskState extends State<LoginMask> {
  // Nimmt die Eingabe aus dem Eingabefeld
  // für den Username auf
  late String _username;

  // Nimmt die Eingabe aus dem Eingabefeld
  // für das Passwort auf
  late String _password;

  // Nimmt den Wert true ein, wenn sowohl
  // _username als auch _password nicht leer sind
  late bool _canLogin;

  late String _headline;

  @override
  void initState() {
    super.initState();

    _username = '';
    _password = '';
    _canLogin = false;

    _headline = 'Willkommen';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialisierungen oder Anpassungen
  }

  @override
  void didUpdateWidget(Object oldWidget) {
    super.didUpdateWidget(oldWidget as LoginMask);

    // Resourcen freigeben
  }

  @override
  void deactivate() {
    super.deactivate();

    // Aufräumen
  }

  @override
  void dispose() {
    super.dispose();

    // Resourcen freigeben
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_headline),
            TextField(onSubmitted: _onSubmittedUsername),
            TextField(onSubmitted: _onSubmittedPassword),
            TextButton(
              onPressed: _canLogin
                  ? () {
                      setState(() {
                        _headline = MyApp.appBarKey.currentWidget.runtimeType
                            .toString();
                      });
                    }
                  : null,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );

    // Beispiel Cupertino
    //    return Center(
    //       child: SizedBox(
    //         width: 300,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text('Willkommen'),
    //             CupertinoTextField(),
    //             CupertinoTextField(),
    //             CupertinoButton(
    //               onPressed: () {},
    //               child: Text('Login'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
  }

  void _onSubmittedUsername(String username) {
    _username = username;
    _checkCanLogin();
  }

  void _onSubmittedPassword(String password) {
    _password = password;
    _checkCanLogin();
  }

  void _checkCanLogin() {
    setState(() {
      _canLogin = _username.isNotEmpty && _password.isNotEmpty;
    });
  }
}
