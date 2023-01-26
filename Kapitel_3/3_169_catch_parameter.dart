void main() {
  try {
    // Der übergebene String ist nicht
    // in eine Zahl verwandelbar. Eine
    // FormatException ist die Folge.
    final number = int.parse('abc');
  } catch (e, s) { // wir greifen den 2. Parameter (s) ab
    // Wir haben die Exception gefangen
    print(e);
    // Der Stacktrace aus catch
    print(s);
  }

}