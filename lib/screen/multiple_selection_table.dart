import 'package:flutter/material.dart';
import 'package:sahash/models/user.dart';

class MultipleSelectionTable extends StatefulWidget {
  const MultipleSelectionTable({Key key}) : super(key: key);

  @override
  State<MultipleSelectionTable> createState() => _MultipleSelectionTableState();
}

class _MultipleSelectionTableState extends State<MultipleSelectionTable> {
  List<User> users;
  List<User> selectedUser;

  @override
  void initState() {
    selectedUser = [];
    users = User.getUsers();
    super.initState();
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUser.add(user);
      } else {
        selectedUser.remove(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Selection Table"),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Image.asset('assets/icon_arrow_back.png'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                border: TableBorder.all(
                  color: const Color.fromARGB(255, 205, 205, 205),
                ),
                columns: const [
                  DataColumn(
                    label: Text("First Name", style: TextStyle(fontSize: 18)),
                  ),
                  DataColumn(
                      label: Text("Last Name", style: TextStyle(fontSize: 18))),
                  DataColumn(
                      label: Text("Age", style: TextStyle(fontSize: 18))),
                ],
                rows: users
                    .map((user) => DataRow(
                            selected: selectedUser.contains(user),
                            onSelectChanged: (b) {
                              onSelectedRow(b, user);
                            },
                            cells: [
                              DataCell(Text(user.firstName)),
                              DataCell(Text(user.lastName)),
                              DataCell(Text(user.age)),
                            ]))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
