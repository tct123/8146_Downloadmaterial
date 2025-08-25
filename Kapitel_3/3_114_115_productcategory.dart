enum ProductCategory { beverage, food, technology, literature }

extension ProductCategoryFormatter on ProductCategory {
  String toBetterString() {
    switch (this) {
      case ProductCategory.beverage:
        return 'Kategorie Getränke';
      case ProductCategory.food:
        return 'Kategorie Essen';
      case ProductCategory.technology:
        return 'Kategorie Technik';
      case ProductCategory.literature:
        return 'Kategorie Literatur';
    }
  }
}
