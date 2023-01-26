void main() {
  final numbers = [1, 2, 3];

  final incrementer = (number) => print(number + 1);
  numbers.forEach(incrementer);
  // Ausgabe:
  // 2
  // 3
  // 4

}