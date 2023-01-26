class Book {
  late String title;
  late int numberOfPages;
  late bool opened;

  void open() {
    opened = true;
  }
}

void main() {
  final book = Book();

  book.title = 'Dart';
  book.numberOfPages = 20;
  book.open(); // setzt Variable opened
  print(book.opened); // true
}