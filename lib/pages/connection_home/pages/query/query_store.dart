import 'dart:convert';

import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/query_model.dart';
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

  fetchQuery(QueryModel query) async {
    List<dynamic> result = await QueryRepository().execQuery(query);
    if(result.length == 0) return;

    columns = result[0].keys.toList();
    rows = result;

  }

  @observable
  bool onTop = true;

  @action
  setOnTop(value) {
    onTop = value;
  }

}