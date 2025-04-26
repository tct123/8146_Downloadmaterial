import 'package:flutter/material.dart';

class AutoFillExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofillHints: [AutofillHints.email, AutofillHints.name],
        ),

        // Beispiel LoginMask-Anpassung
        // AutofillGroup(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // ...
        //       const SizedBox(height: 8),
        //       // Nutzername
        //       CupertinoTextField(
        //         autofocus: true,
        //         autofillHints: [AutofillHints.email, AutofillHints.name],
        //         placeholder: 'Nutzername',
        //         clearButtonMode: OverlayVisibilityMode.editing,
        //         controller: _userTextController,
        //         onChanged: (text) => print(text),
        //         onEditingComplete: () => print('Bearbeitung beendet'),
        //         onSubmitted: (text) {
        //           _passwordFocusNode.requestFocus();
        //         },
        //       ),
        //       const SizedBox(height: 8),
        //       // Passwort
        //       CupertinoTextField(
        //         autofillHints: [AutofillHints.password],
        //         focusNode: _passwordFocusNode,
        //         placeholder: 'Passwort',
        //         clearButtonMode: OverlayVisibilityMode.editing,
        //         obscureText: true,
        //         obscuringCharacter: 'X',
        //         keyboardType: TextInputType.number,
        //         onChanged: (text) {
        //           if (text.length >= 6) {
        //             _commentFocusNode.requestFocus();
        //           }
        //         },
        //       ),
        //       const SizedBox(height: 8),
        //       // ...
        //
        //     ],
        //   ),
        // )
      ],
    );
  }
}
