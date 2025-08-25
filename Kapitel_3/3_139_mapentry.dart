void main() {
  final characters = {'a': 1, 'b': 2, 'c': 3};

  // Eine Liste von MapEntrys wird angehängt
  final nextCharacters = [MapEntry('d', 4), MapEntry('e', 5)];
  characters.addEntries(nextCharacters);
  print(characters); // {a: 1, b: 2, c: 3, d: 4, e: 5}

  // fügt eine andere Map gleichen Typs an
  characters.addAll({'f': 6, 'g': 7});
  print(characters); // {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7}

  // Fügt ein einzelnes Paar über den []=-Operator ein
  characters['h'] = 8;
  print(characters); // {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8}

  // Falls der Schlüssel bereits vorhanden ist,
  // wird er nicht überschrieben. Falls 'ifAbsent'
  // zutrifft, so wird der zurückgegebene Wert
  // der Lambda-Funktion eingefügt, hier 9.
  characters.putIfAbsent('i', () => 9);
  print(characters); // {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9}
}
