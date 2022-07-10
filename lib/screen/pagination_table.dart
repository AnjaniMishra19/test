import 'dart:math';

import 'package:flutter/material.dart';

class PaginationTable extends StatefulWidget {
  const PaginationTable({Key key}) : super(key: key);

  @override
  State<PaginationTable> createState() => _PaginationTableState();
}

class _PaginationTableState extends State<PaginationTable> {
  final DataTableSource _data = MyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination Table"),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Image.asset('assets/icon_arrow_back.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaginatedDataTable(
              source: _data,
              header: const Text('My Produts'),
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Price'))
              ],
              columnSpacing: 100,
              horizontalMargin: 10,
              rowsPerPage: 10,
            )
          ],
        ),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }
}
