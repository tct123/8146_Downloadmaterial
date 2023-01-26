void main() {
  final hour = '9';
  final minutes = '5';
  print('Es ist $hour:$minutes Uhr'); // Ausgabe: Es ist 9:5 Uhr

  print('Es ist ${hour.padLeft(2, '0')}:${minutes.padLeft(2, '0')} Uhr');
}