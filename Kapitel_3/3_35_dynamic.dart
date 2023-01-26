void main() {
  // Eine List vom Typ dynamic
  final a = <dynamic>[];

  // dies ermöglicht es, unterschiedliche Typen einzufügen
  a.add(2);
  a.add('Hello, World');
  a.add(false);

  // Schließlich können wir alle Objekte ausgeben
  print(a); // [2, Hello, World, false]
}
