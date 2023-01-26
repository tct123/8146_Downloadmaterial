void main() {
  final numbers = [1, 2, 3];

  print(numbers.runtimeType); // List<int>
  final casted = numbers.cast<num>();
  print(casted.runtimeType); // CastList<int, num>

}