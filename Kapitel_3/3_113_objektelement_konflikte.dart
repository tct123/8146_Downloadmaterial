extension IntExtensions on int {
  // …
  // Wir versuchen, eine Extension Method einzuführen,
  // die den gleichen Bezeichner wie int.round()
  // besitzt.
  int round() => 1000;
}

void main() {
  // Aufruf
  print(2.round()); // Gibt 2 aus, nicht 1000
}

