void main() {
  final numbers = [1, 2, 3, 4];

  // Wir geben fold den Typ des Anfangswerts mit,
  // weil es sonst von Object ausgeht und nicht von int.
  // Object definiert aber keinen +-Operator,
  // weshalb der Code fehlerhaft wäre.
  print(numbers.fold<int>(0, (sum, n) => sum + n));

  // Reduce nimmt jeweils zwei Elemente der
  // Collection. Wir addieren sie entsprechend.
  // Ist nur ein Element in der Collection,
  // so gibt reduce dieses erste Element zurück.
  print(numbers.reduce((a, b) => a + b));

}