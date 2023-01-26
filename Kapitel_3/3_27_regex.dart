void main() {
  final regex = RegExp(r'\d+');

  final firstMatch = regex.firstMatch('123aa456');
  print(firstMatch!.group(0)); // 123
}