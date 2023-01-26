void main() {
  sayTwoThings(greeting: 'Hello, World', number: 2);
}

void sayTwoThings({String? greeting, int? number}) {
  print(greeting);
  print(number);
}
