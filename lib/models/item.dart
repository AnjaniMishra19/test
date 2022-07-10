class Item {
  const Item({
    this.totalPriceCents,
    this.name,
    this.uid,
    this.imageProvider,
  });
  final int totalPriceCents;
  final String name;
  final String uid;
  final String imageProvider;
  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}
