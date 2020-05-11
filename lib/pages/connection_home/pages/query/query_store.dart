import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';
import 'package:mobx/mobx.dart';

import 'query_repository.dart';

part 'query_store.g.dart';

class QueryStore = _QueryStore with _$QueryStore;

abstract class _QueryStore with Store {

  @computed
  bool get isQueryInSingleTable => types.map((type) => type.tableId).every((value) => value == types[0].tableId);

  @observable
  dynamic querySaved = QuerySaved();

  @action setQuery(String value) {
    querySaved = querySaved.copyWith(query: value);
  }

  @observable
  List<TypesResponseQueryModel> types = [];

  @observable
  List<String> columns = [];

  @observable
  List<dynamic> rows = [];

  @observable
  List<dynamic> renderedRows = [];

  @action
  fetchQuery(QueryModel query) async {
    //position 0 is the value and position 1 is the types
    List<dynamic> result = await QueryRepository().execQuery(query);
    print(result.toString());
    types = List<TypesResponseQueryModel>.from(result[1]);
    columns = types.map((v) => v.columnName).toList();
    rows = List<dynamic>.from(result[0]);
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
      print(rows.toString());
    }


  }

}