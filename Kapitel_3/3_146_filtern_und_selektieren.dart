void main() {
  final planets = ['Erde', 'Mars', 'Venus'];

  // firstWhere -> Anfangsbuchstabe V
  print(planets.firstWhere((p) => p.startsWith('V')));
  // Ergebnis: Venus

  // lastWhere -> Endbuchstabe s
  print(planets.lastWhere((p) => p.endsWith('s')));
  // Ergebnis: Venus

  // Überspringe (von Beginn) zwei Elemente
  print(planets.skip(2));
  // Ergebnis: (Venus)

  // Überspringe, solange Anfangsbuchstabe
  // nicht ein V ist, nehmeimm alle Elemente
  // ab da auf
  print(planets.skipWhile((p) => p.startsWith('V') == false));
  // Ergebnis: (Venus)

  // Gegensatz zu skip.
  // Nehme Nimm die ersten beiden Elemente
  print(planets.take(2));
  // Ergebnis: (Erde, Mars)
  // Nehme Nimm alle Elemente, bis ein Element mit V anfängt
  print(planets.takeWhile((p) => p.startsWith('V') == false));
  // Ergebnis: (Erde, Mars)

  // Alle Elemente, die mit s enden
  print(planets.where((p) => p.endsWith('s')));
  // Ergebnis: (Mars, Venus)

}