Future<void> main() async {
  final durationToWait = Duration(seconds: 2);
  // die Verzögerung mit await abwarten
  await Future.delayed(durationToWait);
  // wie bei synchronem Code Errors und
  // Exceptions mit tTry/cCatch   behandeln
  try {
    // Eine asynchrone Funktion mit await abwarten
    await Future.sync(() => throw 'Fehler');
    // synchroner Code
    print('Fehlerfrei abgeschlossen');
  }
  catch(e) {
    // wie gewöhnlich verarbeiten
    print(e);
  }
}
