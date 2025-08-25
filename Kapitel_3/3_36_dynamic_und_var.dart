void main() {
  // b wird als dynamic initialisiert
  // und ist eine Referenz auf ein Objekt
  dynamic b = 'Ein String';
  print(b); // Ein String
  // eine erneute Zuweisung eines Objekts
  b = false;
  print(b); // false

  // Das gGleiche ist mit var nicht möglich
  var c = 'Ein String';
  print(c); // Ein String
  // Fehler, c ist eine Referenz auf String
  c = false as String;
  print(c);
}
