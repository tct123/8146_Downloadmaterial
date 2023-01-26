class Page {
  const Page({required this.number});

  // Named Constructor von Page
  const Page.numbered({required this.number});

  // Ein weiterer Named Constructor,
  // wir rufen aber intern den
  // Standardkonstruktor auf
  const Page.empty() : this(number: 0);

  final int number;
}
