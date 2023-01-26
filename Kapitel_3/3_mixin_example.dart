mixin Barcode {
  // Ohne super
  // String _id;

  // Ohne super
  // String get id => _id;
  // Mit super
  String get id => super.hashCode.toString();

  // Ohne super
  // void initializeOnProduct(Object product) {
  //   _id = product.hashCode.toString();
  // }

}

mixin InternalDisplay on Computer {}

class Laptop extends Computer with InternalDisplay {}

class Computer with Barcode {
  Computer() {
    // Ohne super
    // initializeOnProduct(this);
  }
}

class Wine with Barcode {
  Wine() {
    // Ohne super
    // initializeOnProduct(this);
  }
}