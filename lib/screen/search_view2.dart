import 'package:flutter/material.dart';
import 'package:sahash/customWidgets/search_widget.dart';
import 'package:sahash/models/search_product.dart';

class SearchView2 extends StatefulWidget {
  const SearchView2({Key key}) : super(key: key);

  @override
  State<SearchView2> createState() => _SearchView2State();
}

class _SearchView2State extends State<SearchView2> {
  List<Product> products;
  String query = '';

  @override
  void initState() {
    super.initState();
    products = allProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter & SearchListView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchWidget(
            text: query,
            hintText: 'Title of the Author Name',
            onChanged: searchProduct,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return buildProduct(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProduct(Product product) => ListTile(
        leading: Image.network(
          product.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(product.title),
        subtitle: Text(product.author),
      );

  void searchProduct(String query) {
    final products = allProduct.where((item) {
      final titleLower = item.title.toLowerCase();
      final authorLower = item.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.products = products;
    });
  }
}
