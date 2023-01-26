void main() {
  try {
    // Wir erzeugen eine leere Liste,
    // aber greifen auf den ersten Index zu.
    // Ein RangeError ist die Folge.
    final list = [];
    final element = list[0];
  } catch(e) {
    // Wir haben den Error gefangen.
    print(e);
  }

}