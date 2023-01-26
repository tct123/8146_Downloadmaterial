// die aufgerufene Funktion benutzt den Rückgabetyp int
int a = add(2, 4);
// der Rückgabetyp ändert sich zu einer Fließkommazahl
// alle Aufrufe in Ihrer App sind anzupassen ...
double a = add(2, 4);

// Einsatz von Typinferenz
// Bleibt auch beim Wechsel des konkreten Typs gleich!
// Wahrscheinlich ist keine Anpassung in Ihrem Code nötig.
final a = add(2, 4);

int add(int a, int b) {
  return a + b;
}