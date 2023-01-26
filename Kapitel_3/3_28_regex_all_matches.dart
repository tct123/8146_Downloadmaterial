void main() {
  final regex = RegExp(r'\d+');
  final allMatches = regex.allMatches('123aa456');
  for (final match in allMatches) {
    print(match.group(0)); // erst 123, dann 456
  }
}