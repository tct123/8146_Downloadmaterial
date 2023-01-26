typedef ImportantCallback = void Function();
typedef ImportantSetter = void Function(int number);
typedef ImportantGetter = String Function();
typedef UnimportantGetter = String Function();

void compareGetter() {
  print(ImportantGetter == UnimportantGetter); // true
}

typedef JSON = Map<String, dynamic>;
typedef Bytes = List<int>;

class ImportantPerformer {
  late ImportantCallback callback;
  late ImportantSetter setter;
  late ImportantGetter getter;
  late int aNumber;

  // ...
}
