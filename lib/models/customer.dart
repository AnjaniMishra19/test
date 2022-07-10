import 'package:sahash/models/item.dart';

class Customer {
  Customer({
    this.name,
    this.imageProvider,
    List<Item> items,
  }) : items = items ?? [];

  final String name;
  final String imageProvider;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents =
        items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
