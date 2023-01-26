void main() {
  final username = ' Maxi Musterfrau ';
  final trim = username.trim();
  print(trim); // Ausgabe: 'Maxi Musterfrau'
  print(username.trimLeft()); // Ausgabe: 'Maxi Musterfrau '
  print(username.trimRight()); // Ausgabe: ' Maxi Musterfrau
}