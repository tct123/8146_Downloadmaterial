import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewExample extends StatefulWidget {
  @override
  _InAppWebViewExampleState createState() => _InAppWebViewExampleState();
}

// Erste Ausbaustufe: gleicher Umfang wie webview_flutter
// class _InAppWebViewExampleState extends State<InAppWebViewExample> {
//   InAppWebViewController _webViewController;
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
//           child: InAppWebView(
//             onWebViewCreated: (webViewController) {
//               _webViewController = webViewController;
//             },
//             initialUrlRequest: URLRequest(
//               url: Uri.https('flutter.dev', ''),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


class _InAppWebViewExampleState extends State<InAppWebViewExample> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          final canGoBack = await _webViewController.canGoBack();
          if (canGoBack) {
            await _webViewController.goBack();
          }

          // Die App-Navigation verhindern
          return false;
        },
        child: SafeArea(
          child: InAppWebView(
            onWebViewCreated: (webViewController) {
              _webViewController = webViewController;
            },
            initialUrlRequest: URLRequest(
              url: Uri.https('flutter.dev', ''),
            ),
            contextMenu: ContextMenu(
              options: ContextMenuOptions(
                hideDefaultSystemContextMenuItems: true,
              ),
              menuItems: [
                ContextMenuItem(
                  iosId: '1',
                  androidId: 1,
                  title: 'Aktion 1',
                  action: () => print('Aktion 1 ausgewählt'),
                ),
                ContextMenuItem(
                  iosId: '2',
                  androidId: 2,
                  title: 'Aktion 2',
                  action: () => print('Aktion 2 ausgewählt'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
