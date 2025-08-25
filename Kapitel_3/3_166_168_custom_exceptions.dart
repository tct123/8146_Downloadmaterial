// Ein Error wird geerbt.
class CustomError extends Error {}

// Eine Exception wird hingegen implementiert (Interface).
class CustomException implements Exception {}

void main() {
  // Möglich, aber Dart rät davon ab
  throw 'This is not a drill!';
  // Empfohlen, liest automatisch
  // Informationen wie den StackTrace aus
  throw CustomError();

  // Eine eigene Exception, um einen
  // Ausnahmefall zu signalisieren
  throw CustomException();
}
