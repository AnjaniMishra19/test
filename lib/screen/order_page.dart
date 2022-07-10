import 'package:sahash/customWidgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String _staticchosenValue;
  String _dynamicchosenValue;
  String mobile;
  List<String> staticdropDownItems = ['Lead', 'Customer'];
  List<String> cutomerDropDownItems = ['Lead', 'Customer'];
  List<String> leadDropDownItems = ['Lead', 'Customer'];
  List<String> option = ['Hindi', 'English'];
  TextEditingController staticfieldValue = TextEditingController();
  TextEditingController dynamicfieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: staticfieldValue,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 202, 201, 201),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 202, 201, 201), width: 1.5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      isExpanded: true,
                      value: _staticchosenValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 35,
                      ),
                      items: staticdropDownItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(value),
                            ));
                      }).toList(),
                      hint: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Select Data")),
                      onChanged: (String value) {
                        setState(() {
                          _staticchosenValue = value;
                          staticfieldValue.text = _staticchosenValue;
                        });
                      },
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: dynamicfieldValue,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 202, 201, 201),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 202, 201, 201), width: 1.5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      isExpanded: true,
                      value: _dynamicchosenValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 35,
                      ),
                      items: _staticchosenValue == 'Customer'
                          ? cutomerDropDownItems
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(value),
                                  ));
                            }).toList()
                          : leadDropDownItems
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(value),
                                  ));
                            }).toList(),
                      hint: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Select Data")),
                      onChanged: (String value) {
                        setState(() {
                          _dynamicchosenValue = value;
                          dynamicfieldValue.text = _dynamicchosenValue;
                        });
                      },
                    )),
                  ),
                ),
              ),
            ),
            CustomDropdown(
              fieldValue: staticfieldValue,
              hintText: 'Select Data',
              options: option,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(5),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(3)
                },
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: const [
                        Text('Website', style: TextStyle(fontSize: 15))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: const [
                        Text('Tutorial', style: TextStyle(fontSize: 15))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: const [
                        Text('Review', style: TextStyle(fontSize: 15))
                      ]),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('Javatpoint')])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('Flutter')])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('5*')])),
                  ]),
                  TableRow(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('Javatpoint')])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('MySQL')])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('5*')])),
                  ]),
                  TableRow(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('Javatpoint')])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('ReactJS')])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: const [Text('5*')])),
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            DataTable(
              columns: const [
                DataColumn(label: Text("Id", style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Name', style: TextStyle(fontSize: 18))),
                DataColumn(
                    label: Text('Profession', style: TextStyle(fontSize: 18))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Actor')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('John')),
                  DataCell(Text('Student')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Harry')),
                  DataCell(Text('Leader')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Peter')),
                  DataCell(Text('Scientist')),
                ]),
              ],
              sortColumnIndex: 0,
              sortAscending: true,
            ),
          ],
        ),
      ),
    );
  }
}
