void main() {
  final regex = RegExp(r'\d+');
  final stringMatch = regex.stringMatch('123aa456');
  print(stringMatch);
}
