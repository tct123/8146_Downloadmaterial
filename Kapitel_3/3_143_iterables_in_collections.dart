void main() {
  final planets = ['Erde', 'Mars', 'Venus'];
  Iterable<String> fromList = planets.toList();
  Iterable<String> fromSet = planets.toSet();
  print(fromList); // [Erde, Mars, Venus]
  print(fromSet); // {Erde, Mars, Venus}
}
