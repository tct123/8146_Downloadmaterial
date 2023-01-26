Future<int> getAsyncNumber() async {
  // asynchroner Code
  return 42;
}

Future<String> getAsyncName() async {
  // asynchroner Code
  return 'Maxi';
}

void callAsync() async {
  final number = await getAsyncNumber();
  final name = await getAsyncName();
  print('Nummer: $number, Name: $name');
}
