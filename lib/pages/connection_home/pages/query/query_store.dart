import 'dart:convert';

import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'query_repository.dart';

part 'query_store.g.dart';

class QueryStore = _QueryStore with _$QueryStore;

abstract class _QueryStore with Store {

  @observable
  dynamic querySaved = QuerySaved();

  @action setQuery(String value) {
    querySaved = querySaved.copyWith(query: value);
  }

  @observable
  List<String> columns = [];

  @observable
  List<dynamic> rows = [];

  @observable
  List<dynamic> renderedRows = [];

  @action
  fetchQuery(QueryModel query) async {
    List<dynamic> result = await QueryRepository().execQuery(query);
    if(result.length == 0) return;

    columns = result[0].keys.toList();
    rows = result;
    setRenderedRows();
  }

  @observable
  bool onTop = true;

  @action
  setOnTop(value) {
    onTop = value;
  }

  @observable
  int columnSortIndex = 0;

  @observable
  bool columnSortAsc = true;

  @action
  changeTableSort(int position, bool asc) {
    columnSortAsc = asc;
    if(position != columnSortIndex) {
      columnSortIndex = position;
    }
    setRenderedRows();
  }

  @action
  setRenderedRows() {
    rows.sort((a, b) => a[columns[columnSortIndex]].toString().compareTo(b[columns[columnSortIndex]].toString()));
    if(!columnSortAsc) {
      rows = List<dynamic>.from(rows.reversed);
    }
    var items = rows.map((row) {
      var temp = row.values.map((value) => DataCell(Text(value.toString())));
      return DataRow(cells: List<DataCell>.from(temp));
    });
    renderedRows = List<DataRow>.from(items);
  }

}