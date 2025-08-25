class Book {}

void main() {
  // Sie instanziieren ein Objekt
  final book = Book();

  // Sie rufen den Typ ab
  print(book.runtimeType); // Book
  // Book als String
  print(book.toString()); // Instance of 'Book'
  // die numerische Repräsentation
  // der Instanz von Book
  print(book.hashCode); // 747197887
}
