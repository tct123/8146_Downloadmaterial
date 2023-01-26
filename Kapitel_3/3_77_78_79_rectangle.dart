class Rectangle {
  double sideA = 0.0;
  double sideB = 0.0;

  int get hashCode => sideA.hashCode ^ sideB.hashCode;

  bool operator ==(Object other) {
    final otherIsIdentical = identical(other, this);
    final otherHasSameValues =
        other is Rectangle && other.sideA == sideA && other.sideB == sideB;
    return otherIsIdentical || otherHasSameValues;
  }

  @override
  String toString() =>
      'Rechteck mit Seite A: $sideA und Seite B: $sideB';

  @override
  void noSuchMethod(Invocation invocation) {
    print('Die Methode wurde nicht gefunden: ${invocation.memberName}');
    super.noSuchMethod(invocation); // Fehler NoSuchMethodError werfen
  }

}