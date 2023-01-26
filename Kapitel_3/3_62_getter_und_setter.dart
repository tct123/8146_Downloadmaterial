void main() {
  // Wir setzen die Werte über die Setter
  greeting = 'Hello';
  number = 2;

  print(greeting);
  print(number);
}

// Die Variablen
var _greetingText = '';
var _number = 0;

// Die Setter
set greeting(String newGreeting) => _greetingText = newGreeting;

set number(int numberToSet) {
  _number = numberToSet;
}

// Die Getter
String get greeting => _greetingText;
int get number => _number;
