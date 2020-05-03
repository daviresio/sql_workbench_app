import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';
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
  List<TypesResponseQueryModel> types = [];

  @observable
  List<String> columns = [];

  @observable
  List<dynamic> rows = [];

  @observable
  List<dynamic> renderedRows = [];

  @action
  fetchQuery(QueryModel query) async {
    List<QueryResponseModel> result = await QueryRepository().execQuery(query);
    if(result == null || result.length == 0) return;

    columns = result[0].data.keys.toList();
    rows = List<dynamic>.from(result.map((value) => value.data));
    types = result[0].types;
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


  }

}