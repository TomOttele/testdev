import 'package:testdev/data/usersT.dart';
import 'package:testdev/data/userT.dart';
import 'package:flutter/material.dart';

class SortablePage extends StatefulWidget {
  const SortablePage({super.key});

  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildDataTable(),
      );

  Widget buildDataTable() {
    final columns = ['', '', '', ''];

    return DataTable(
      dataTextStyle: Theme.of(context).textTheme.bodyMedium,
      headingRowHeight: 0,
      showBottomBorder: false,
      dividerThickness: 0,
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Expanded(
                child: Text(
              column,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.clubname, user.team, user.function, user.number];

        return DataRow(
            cells: getCells(
          cells,
        ));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(
            SizedBox(
              width: 50,
              child: Text(
                '$data',
                maxLines: 1,
                overflow: TextOverflow.visible,
              ),
            ),
          ))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.clubname, user2.clubname));
    } else if (columnIndex == 1) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.team, user2.team));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.function, user2.function));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.number, user2.number));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
