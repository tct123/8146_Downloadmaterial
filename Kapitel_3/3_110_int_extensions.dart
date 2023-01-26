extension IntExtensions on int {
  int toNegative() => this * -1;

  static int specialNumber = 42;
  static String greeting = 'Hello';
}

void main() {
  // …
  // Benutzung:
  print(IntExtensions.specialNumber); // 42
  print(IntExtensions.greeting); // Hello
}
