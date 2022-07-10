import 'package:flutter/material.dart';
import 'package:sahash/models/table_model.dart';
import 'package:sahash/service/manu_page_service.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SyncfusionDatagridDemo extends StatefulWidget {
  const SyncfusionDatagridDemo({Key key}) : super(key: key);

  @override
  State<SyncfusionDatagridDemo> createState() => _SyncfusionDatagridDemoState();
}

class _SyncfusionDatagridDemoState extends State<SyncfusionDatagridDemo> {
  ManuPageService _manuPageService;
  bool _isLoading = false;
  List<TableList> _list = [];
  List<TableList> selectedList;
  var pageCount = 0.0;
  final DataGridController _controller = DataGridController();
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Syncfusion Datagrid"),
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
      body: Column(
        children: [
          !_isLoading
              ? _list != null
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SfDataGrid(
                          swipeMaxOffset: 121.0,
                          endSwipeActionsBuilder: _buildEndSwipeWidget,
                          startSwipeActionsBuilder: _buildStartSwipeWidget,
                          controller: _controller,
                          headerRowHeight: 60,
                          key: key,
                          defaultColumnWidth: 150,
                          allowSwiping: true,
                          allowMultiColumnSorting: true,
                          allowSorting: true,
                          frozenColumnsCount: 1,
                          gridLinesVisibility: GridLinesVisibility.horizontal,
                          headerGridLinesVisibility:
                              GridLinesVisibility.horizontal,
                          columnWidthMode: ColumnWidthMode.fill,
                          columns: [
                            GridColumn(
                                width: 70,
                                columnName: 'id',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Id',
                                        style: TextStyle(fontSize: 18)))),
                            GridColumn(
                                width: 120,
                                columnName: 'first name',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('First Name',
                                        style: TextStyle(fontSize: 18)))),
                            GridColumn(
                                width: 120,
                                columnName: 'last name',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Last Name',
                                        style: TextStyle(fontSize: 18)))),
                            GridColumn(
                                width: 120,
                                columnName: 'address',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Address',
                                        style: TextStyle(fontSize: 18)))),
                            GridColumn(
                                width: 120,
                                columnName: 'email',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Email',
                                        style: TextStyle(fontSize: 18)))),
                            GridColumn(
                                width: 120,
                                columnName: 'website',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Website',
                                        style: TextStyle(fontSize: 18)))),
                            GridColumn(
                                width: 120,
                                columnName: 'hours',
                                label: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Hours',
                                        style: TextStyle(fontSize: 18)))),
                          ],
                          source: EmployeeDataSource(employeeData: _list),
                        ),
                      ),
                    )
                  : const Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: Text(
                            "No Record Found",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )))
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.height * 0.50,
                  child: const Center(child: CircularProgressIndicator())),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _list.length > 10
                  ? IconButton(
                      onPressed: () {
                        if (pageCount > 0) {
                          setState(() {
                            pageCount -= 10;
                          });
                          _controller.scrollToCell(pageCount, 1,
                              canAnimate: true,
                              rowPosition: DataGridScrollPosition.start,
                              columnPosition: DataGridScrollPosition.start);
                        }
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.grey))
                  : IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.grey)),
              Text(
                pageCount.toInt().toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              _list.length > 10
                  ? IconButton(
                      onPressed: () {
                        if (pageCount <= _list.length && _list.isNotEmpty) {
                          _controller.scrollToCell(pageCount, 1,
                              canAnimate: true,
                              rowPosition: DataGridScrollPosition.start,
                              columnPosition: DataGridScrollPosition.start);
                          setState(() {
                            pageCount += 10;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEndSwipeWidget(
      BuildContext context, DataGridRow row, int rowIndex) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.delete, color: Colors.white, size: 20),
            SizedBox(width: 16.0),
            Text(
              'DELETE',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStartSwipeWidget(
      BuildContext context, DataGridRow row, int rowIndex) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.edit, color: Colors.white, size: 20),
            SizedBox(width: 16.0),
            Text(
              'Edit',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({List<TableList> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((value) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: value.id),
              DataGridCell<String>(
                  columnName: 'first name', value: value.first),
              DataGridCell<String>(columnName: 'last name', value: value.last),
              DataGridCell<String>(columnName: 'address', value: value.address),
              DataGridCell<String>(columnName: 'email', value: value.email),
              DataGridCell<String>(columnName: 'website', value: value.website),
              DataGridCell<String>(columnName: 'hours', value: value.hours),
            ]))
        .toList(growable: false);
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 5.0),
        child: Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              e.value.toString(),
              style: const TextStyle(fontSize: 10),
            )),
      );
    }).toList());
  }
}
