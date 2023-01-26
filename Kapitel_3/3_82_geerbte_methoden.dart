class RoomCleanup {
  void clean() {
    // Staubsaugen
  }
}

class RoomCleanupPlus extends RoomCleanup {
  void clean() {
    super.clean();
    // Fenster putzen
  }
}

void houseCleaning() {
  final cleanup = RoomCleanupPlus();
  // Staubsaugen und Fenster putzen
  cleanup.clean();
}
