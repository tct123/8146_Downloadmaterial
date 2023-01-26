/// Basisklasse für verschiedene Bücher
abstract class Book {
  Book({
    required this.title,
    required this.numberOfPages,
  });

  /// Der Titel dieses Buchs
  final String title;
  /// Die Anzahl der Seiten dieses Buchs
  final int numberOfPages;
  bool _opened = false;

  /// Gibt an, ob dieses Buch geöffnet ist.
  bool get opened => _opened;

  /// Öffnet dieses Buch.
  void open() {
    _opened = true;
  }

  /// Der Verlag dieses Buchs
  static late String publisher;

  /// Gibt "Hello, <publisher>" aus. <publisher> wird über das statische
  /// Feld [publisher] gesetzt.
  static String sayHelloPublisher() => 'Hello $publisher';
}
