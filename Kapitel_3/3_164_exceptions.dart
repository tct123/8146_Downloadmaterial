void main() {
  try {
    // Der übergebene String ist nicht
    // in eine Zahl verwandelbar. Eine
    // FormatException ist die Folge.
    final number = int.parse('abc');
  } catch (e) {
    // Wir haben die Exception gefangen
    print(e);
  }

}