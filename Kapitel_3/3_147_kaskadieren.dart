void main() {
  final elements = ['Erde', 'Mars', 'Venus', '1', '2', '3', '4', '5'];

  final result = elements
      // filtere alle Zahlenstrings heraus
      .where((e) => e.length == 1)
      // Wir benutzen int.parse, um die Zahlenstrings
      // in echte Integer zu verwandeln und sie dann
      // zu überprüfen. Wir filtern alle Zahlen kleiner 4.
      .where((e) => int.parse(e) < 4)
      // Beispielhaft ziehen wir aus dem Ergebnis (1,2,3)
      // die ersten beiden Zahlen heraus.
      .take(2);

  // (1, 2)
  print(result);
}
