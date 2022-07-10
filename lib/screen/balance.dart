import 'package:flutter/material.dart';
import 'package:sahash/models/table_model.dart';
import 'package:sahash/service/manu_page_service.dart';
import 'package:shimmer/shimmer.dart';

class BalanceInformation extends StatefulWidget {
  const BalanceInformation({Key key}) : super(key: key);

  @override
  State<BalanceInformation> createState() => _BalanceInformationState();
}

class _BalanceInformationState extends State<BalanceInformation> {
  ManuPageService _manuPageService;
  bool _isLoading = false;
  int _currentSortColumn = 0;
  bool _isAscending = true;
  List<TableList> _list = [];
  List<TableList> selectedList;

  @override
  void initState() {
    _manuPageService = ManuPageService();
    selectedList = [];
    _fetchAllTableValue();
    super.initState();
  }

  _fetchAllTableValue() async {
    setState(() {
      _isLoading = true;
    });
    _list = await _manuPageService.getTable();
    setState(() {
      _isLoading = false;
    });
  }

  onSelectedRow(bool selected, TableList list) async {
    setState(() {
      if (selected) {
        selectedList.add(list);
      } else {
        selectedList.remove(list);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: !_isLoading
                ? _list != null
                    ? DataTable(
                        sortColumnIndex: _currentSortColumn,
                        sortAscending: _isAscending,
                        border: TableBorder.all(
                          color: const Color.fromARGB(255, 205, 205, 205),
                        ),
                        columns: [
                          const DataColumn(
                              label:
                                  Text("Id", style: TextStyle(fontSize: 18))),
                          DataColumn(
                              label: const Text("First Name",
                                  style: TextStyle(fontSize: 18)),
                              onSort: (columnIndex, _) {
                                setState(() {
                                  _currentSortColumn = columnIndex;
                                  if (_isAscending == true) {
                                    _isAscending = false;
                                    // sort the product list in Ascending, order by Price
                                    _list.sort((productA, productB) => productB
                                        .first
                                        .compareTo(productA.first));
                                  } else {
                                    _isAscending = true;
                                    // sort the product list in Descending, order by Price
                                    _list.sort((productA, productB) => productA
                                        .first
                                        .compareTo(productB.first));
                                  }
                                });
                              }),
                          const DataColumn(
                            label: Text("Last Name",
                                style: TextStyle(fontSize: 18)),
                          ),
                          const DataColumn(
                              label: Text("Address",
                                  style: TextStyle(fontSize: 18))),
                          const DataColumn(
                              label: Text("Email",
                                  style: TextStyle(fontSize: 18))),
                          const DataColumn(
                              label: Text("Website",
                                  style: TextStyle(fontSize: 18))),
                          const DataColumn(
                              label: Text("Hours",
                                  style: TextStyle(fontSize: 18))),
                        ],
                        rows: _list
                            .map((listUser) => DataRow(
                                    selected: selectedList.contains(listUser),
                                    onSelectChanged: (b) {
                                      onSelectedRow(b, listUser);
                                    },
                                    cells: [
                                      DataCell(Text(listUser.id)),
                                      DataCell(Text(listUser.first)),
                                      DataCell(Text(listUser.last)),
                                      DataCell(Text(listUser.address)),
                                      DataCell(Text(listUser.email)),
                                      DataCell(Text(listUser.website)),
                                      DataCell(Text(listUser.hours)),
                                    ]))
                            .toList())
                    : const Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 300),
                            child: Text(
                              "No Record Found",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )))
                // : SizedBox(
                //     height: MediaQuery.of(context).size.height * 0.50,
                //     width: MediaQuery.of(context).size.height * 0.50,
                //     child: const Center(child: CircularProgressIndicator())),
                : buildShimmer(),
          ),
        ),
      ]),
    );
  }

  Widget buildShimmer() => SizedBox(
        child: Shimmer.fromColors(
            baseColor: Colors.grey[400],
            highlightColor: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      );
                      // ListTile(
                      //   leading: ShimmerWidget.circular(
                      //     width: 64,
                      //     height: 64,
                      //     shapeBorder: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      //   title: const ShimmerWidget.rectangular(height: 16),
                      //   subtitle: const ShimmerWidget.rectangular(height: 14),
                      // );
                    })),
              ),
            )),
      );
}
