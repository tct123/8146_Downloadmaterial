import 'extension_methods/a.dart';
// Mit hide verstecken wir Sie explizit die eExtension

void main() {
  // Dart kann nun die Extension Method auflösen
  // und meldet keinen Fehler mehr
  print(''.sayHello());
}
