import 'package:flutter/material.dart';

import '../query_store.dart';

class QueryResultTable extends DataTableSource {

  final QueryStore _controller;
  final Function tapRow;

  QueryResultTable(this._controller, this.tapRow);

  @override
  DataRow getRow(int index) {
    var row = _controller.rows[index];
    var rowWidget = row.values.map((value) => DataCell(Text(value.toString()),
        onTap: () {
      var param = Map<String, dynamic>.from(row);
      tapRow(param);
  }));

    return DataRow(cells: List<DataCell>.from(rowWidget));
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _controller.rows.length;

  @override
  int get selectedRowCount => 0;
  
}