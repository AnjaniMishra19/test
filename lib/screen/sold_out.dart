import 'package:sahash/customWidgets/customer_cart.dart';
import 'package:sahash/customWidgets/drag_list_item.dart';
import 'package:sahash/customWidgets/menu_list_item.dart';
import 'package:sahash/models/customer.dart';
import 'package:sahash/models/item.dart';
import 'package:flutter/material.dart';

const List<Item> _items = [
  Item(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: 'assets/icon_arrow_back.png',
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: 'assets/icon_arrow_back.png',
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: 'assets/icon_arrow_back.png',
  ),
];

@immutable
class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({Key key}) : super(key: key);

  @override
  _ExampleDragAndDropState createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  final List<Customer> _people = [
    Customer(
      name: 'Makayla',
      imageProvider: 'assets/icon_arrow_back.png',
    ),
    Customer(
      name: 'Nathan',
      imageProvider: 'assets/icon_arrow_back.png',
    ),
    Customer(
      name: 'Emilio',
      imageProvider: 'assets/icon_arrow_back.png',
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    Item item,
    Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text("Order Food"),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return _buildMenuItem(
                        item: item,
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: _people.map(_buildPersonWithDropZone).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    Item item,
  }) {
    return LongPressDraggable<Item>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        photoProvider: item.imageProvider,
      ),
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        photoProvider: item.imageProvider,
      ),
    );
  }

  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              customer: customer,
            );
          },
        ),
      ),
    );
  }
}
