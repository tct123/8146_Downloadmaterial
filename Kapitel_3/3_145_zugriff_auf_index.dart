void main() {
  final planets = ['Erde', 'Mars', 'Venus'];
  // planets als List und gleichzeitig
  // auch Iterable
  print(planets[0]); // Erde
  print(planets.elementAt(0)); // Erde
  // Wir erzeugen uns künstlich
  // aus List ein Iterable
  final iterable = planets.where((_) => true);
  // Nur noch elementAt verfügbar
  print(iterable.elementAt(0)); // Erde
  // Fehler, nicht implementiert
  print(iterable[0]);

}