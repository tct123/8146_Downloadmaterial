void main() {
  final planets = ['Erde', 'Mars', 'Venus'];

  // Unsere Bedingung, die wir als
  // Lambda an any und every übergeben
  final condition = (String planet) => planet.startsWith('E');
  // Erfüllt eines der Elemente die Bedingung?
  final any = planets.any(condition);
  // Erfüllen alle Elemente die Bedingung?
  final every = planets.every(condition);
  print(any); // true, mindestens eins
  print(every); // false, nur eins
}
