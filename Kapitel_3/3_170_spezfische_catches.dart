// Eine Exception wird hingegen implementiert (Interface).
class CustomException implements Exception { }

void main() {
  try {
    // Der übergebene String ist nicht
    // in eine Zahl verwandelbar. Eine
    // FormatException ist die Folge.
    final number = int.parse('abc');
  }
  on CustomException catch(e) {
    // Anweisungen für CustomException
  }
  on FormatException catch(e, stacktrace) {
    // Anweisungen für FormatException
  }
  catch (e, stacktrace) {
    // Alle anderen Errors, Exceptions oder Objekte

    print(e);
    // Der Stacktrace aus catch
    print(stacktrace);
  }

}