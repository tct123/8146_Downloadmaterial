
// main.dart
import 'extension_methods/a.dart';
import 'extension_methods/b.dart';

void main() {
  // Fehler: Dart weiß nicht, ob wir die Definition
  // aus a.dart oder b.dart verwenden wollen
  print(''.sayHello());
}
