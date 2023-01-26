mixin Barcode {
  late String _id;

  String get id => _id;

  void initializeOnProduct(Object product) {
    _id = product.hashCode.toString();
  }
}

class Computer with Barcode {
  Computer() {
    initializeOnProduct(this);
  }
}

class Wine with Barcode {
  Wine() {
    initializeOnProduct(this);
  }
}