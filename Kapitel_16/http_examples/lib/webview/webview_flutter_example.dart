import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewFlutterExample extends StatefulWidget {
  @override
  _WebviewFlutterExampleState createState() => _WebviewFlutterExampleState();
}

// Erste Ausbaustufe: Nur Webseite anzeigen
class _WebviewFlutterExampleState extends State<WebviewFlutterExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}

// Zweite Ausbaustufe: Verschiedene Callbacks
// class _WebviewFlutterExampleState extends State<WebviewFlutterExample> {
//   WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: WebView(
//           initialUrl: 'https://flutter.dev',
//           onPageStarted: (url) => print('Gestartet: $url'),
//           onPageFinished: (url) => print('Geladen: $url'),
//           onProgress: (progress) => print('Fortschritt bei: $progress %'),
//           navigationDelegate: (navigationRequest) {
//             return navigationRequest.url == '...'
//                 ? NavigationDecision.prevent
//                 : NavigationDecision.navigate;
//           },
//           onWebViewCreated: (webViewController) {
//             _webViewController = webViewController;
//           },
//         ),
//       ),
//     );
//   }
// }

// Dritte Ausbaustufe: WebViewController erhalten
// class _WebviewFlutterExampleState extends State<WebviewFlutterExample> {
//   WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WillPopScope(
//         onWillPop: () async {
//           final canGoBack = await _webViewController.canGoBack();
//           if (canGoBack) {
//             await _webViewController.goBack();
//           }
//
//           // Die App-Navigation verhindern
//           return false;
//         },
//         child: SafeArea(
//           child: WebView(
//             // ...
//             onWebViewCreated: (webViewController) {
//               _webViewController = webViewController;
//             },
//             initialUrl: 'https://flutter.dev',
//           ),
//         ),
//       ),
//     );
//   }
// }

// Vierte Ausbaustufe: Adresszeile
// class _WebviewFlutterExampleState extends State<WebviewFlutterExample> {
//   WebViewController _webViewController;
//   String currentUrl = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: WillPopScope(
//           onWillPop: () async {
//             final canGoBack = await _webViewController.canGoBack();
//             if (canGoBack) {
//               await _webViewController.goBack();
//             }
//
//             // Die App-Navigation verhindern
//             return false;
//           },
//           child: SafeArea(
//             child: Column(
//               children: [
//                 AddressBar(
//                   initialUrl: currentUrl,
//                   onAddressChanged: (addressUri) {
//                     setState(() {
//                       currentUrl = addressUri.toString();
//                     });
//                     FocusManager.instance.primaryFocus.unfocus();
//                     _webViewController.loadUrl(currentUrl);
//                   },
//                   // Statt der Kurzform onRefresh: _webViewController.reload
//                   // muss hier eine einwickelnde Funktion übergeben werden.
//                   // Würde die Kurzform benutzt, wäre _webViewController zum
//                   // Zeitpunkt der Zuweisung noch null.
//                   // onRefresh: _webViewController.reload,
//                   onRefresh: () => _webViewController.reload(),
//                   onBack: () => _webViewController.goBack(),
//                   height: 50,
//                 ),
//                 Expanded(
//                   child: WebView(
//                     // ...
//                     onWebViewCreated: (webViewController) {
//                       _webViewController = webViewController;
//                     },
//                     initialUrl: currentUrl,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class AddressBar extends StatefulWidget {
  const AddressBar({
    required Key key,
    required this.initialUrl,
    required this.onAddressChanged,
    required this.onRefresh,
    required this.onBack,
    required this.height,
  }) : super(key: key);

  final String initialUrl;
  final ValueChanged<Uri> onAddressChanged;
  final VoidCallback onRefresh;
  final VoidCallback onBack;
  final double height;

  @override
  _AddressBarState createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  late TextEditingController _addressTextController;

  @override
  void initState() {
    super.initState();

    _addressTextController = TextEditingController(
      text: widget.initialUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: widget.onBack,
            ),
            Expanded(
              child: TextField(
                controller: _addressTextController,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                widget.onAddressChanged(Uri.https(
                  _addressTextController.text,
                  '',
                ));
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: widget.onRefresh,
            ),
          ],
        ),
      ),
    );
  }
}
