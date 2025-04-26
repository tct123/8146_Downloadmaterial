import 'package:flutter/material.dart';

import 'login_mask_goal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(key: appBarKey),
        body: LoginMask(),
      ),
    );

    //   return CupertinoApp(
    //     home: CupertinoPageScaffold(
    //       child: LoginMask(),
    //     ),
    //   );
    // }
  }
}

// Beispiel Extract to Widget refactoring
// class LoginMask extends StatefulWidget {
//   const LoginMask({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   _LoginMaskState createState() => _LoginMaskState();
// }
//
// class _LoginMaskState extends State<LoginMask> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Willkommen',
//       ),
//     );
//   }
// }
