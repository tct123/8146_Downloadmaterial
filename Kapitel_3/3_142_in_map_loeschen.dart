void main() {
  final characters = {'a': 1, 'b': 2, 'c': 3, 'd': 4};
  print(characters); // {a: 1, b: 2, c: 3, d: 4}

  characters.remove('d');
  print(characters); // {a: 1, b: 2, c: 3}

  // removeWhere nimmt eine Lambda-Funktion auf,
  // deren Parameter jeweils Key und Value erhalten.
  // Entferne alle Buchstaben, bei denen der Index < 3 ist
  characters.removeWhere((c, index) => index < 3);
  print(characters); // {c: 3}
}
