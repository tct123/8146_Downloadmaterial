void main() {
  var numbers;
  final strings = numbers.map((number) => 'Zahl: $number');
  print(strings); // (Zahl: 1, Zahl: 2, Zahl: 3)
  print(strings.join()); // Zahl: 1Zahl: 2Zahl: 3
  // Für ein schöneres Ergebnis geben
  // wir join einen Separator mit.
  // Wir definieren, dass jedes Ergebnis
  // von einem Komma und Zeilenumbruch
  // ausgeleitet werden soll:
  print(strings.join(', \n')); // Ausgabe:
  // Zahl: 1,
  // Zahl: 2,
  // Zahl: 3
}
