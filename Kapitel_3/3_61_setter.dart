// Wir definieren auf Top-Level-Ebene
// zwei Variablen, die wir unten setzen.
// Wir definieren die Variablen außerdem
// als Library-private. Sie sind also nicht
// außerhalb einsehbar.
var _greetingText = '';
var _number = 0;

// Der Setter, um _greetingText zu setzen
set greeting(String newGreeting) => _greetingText = newGreeting;
// … und _number
set number(int numberToSet) {
  _number = numberToSet;
}
