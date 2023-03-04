import 'package:testdev/UI/widgets/scrollable_widget.dart';
import 'package:testdev/data/usersT.dart';
import 'package:testdev/data/userT.dart';
import 'package:flutter/material.dart';

class WalletTransaction extends StatefulWidget {
  const WalletTransaction({super.key});

  @override
  _WalletTransactionState createState() => _WalletTransactionState();
}

class _WalletTransactionState extends State<WalletTransaction> {
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
          body: ScrollableWidget(
        child: buildDataTable(),
      ));

  Widget buildDataTable() {
    final columns = [
      '',
      '',
      '',
      '',
    ];

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
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.visible,
              softWrap: true,
            )),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [
          user.name,
          user.transactionReason,
          user.transactionAmount,
          user.transactionDate,
        ];

        return DataRow(
            cells: getCells(
          cells,
        ));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(
            SizedBox(
              width: 95,
              child: Text(
                '$data',
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      users.sort((user1, user2) => compareString(
          ascending, user1.transactionReason, user2.transactionReason));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) => compareString(
          ascending, user1.transactionDate, user2.transactionDate));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) => compareString(
          ascending, user1.transactionAmount, user2.transactionAmount));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
