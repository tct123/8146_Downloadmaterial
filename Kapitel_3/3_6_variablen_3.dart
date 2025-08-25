void main() {
  var selectedNumber = 42;
  final numberToPrint = selectedNumber;
  selectedNumber = 21; // <- durch final nun ein Fehler
  print(numberToPrint);
}
