void main() {
  Object x = 'Ein String';
  // Fehler, length auf Typ Object nicht bekannt
  final xLength = x.length;

  // Typ wird explizit angegeben
  final cast = x as String;
  // ... sodass Dart die Methode length zuordnen kann
  final length = cast.length;

  // Auch eine in Klammern geschriebene Form ist möglich
  final castAndLength = (x as String).length;
}