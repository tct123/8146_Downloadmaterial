abstract class Book implements PageTurner {
  Book({String? title, int? numberOfPages})
    : _title = title ?? '',
      _numberOfPages = numberOfPages ?? 0;

  String _title;
  int _numberOfPages;
  late bool _opened;

  String get title => _title;

  void set title(String title) => _title = title;

  int get numberOfPages => _numberOfPages;

  void set numberOfPages(int number) => _numberOfPages = number;

  bool get opened => _opened;

  void open() {
    _opened = true;
  }

  Book operator >>(int pages) {
    _page += pages;
    return this;
  }

  Book operator <<(int pages) {
    _page -= pages;
    return this;
  }
}

void changeATitle() {
  // nach abstract Book nicht mehr gültiger Code
  // final book = Book();
  // book._title = 'Neuer Titel';
}

void turnPagesWithOperator() {
  Book aBook = DartBook();
  aBook = aBook << 20;
  aBook = aBook >> 40;
}

abstract class PageTurner {
  late int _page;

  void turn();
}

class DartBook extends Book {
  DartBook({String? title, int? numberOfPages})
    : super(title: title, numberOfPages: numberOfPages);

  int _page = 0;

  void turn() {
    _page = _page + 1;
  }
}

void interact() {
  final book = DartBook();
  book.open();
  print(book.opened); // true
}
