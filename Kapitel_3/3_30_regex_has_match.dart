void main() {
  final regex = RegExp(r'\d+');
  final hasMatch = regex.hasMatch('aa');
  print(hasMatch); // false
}