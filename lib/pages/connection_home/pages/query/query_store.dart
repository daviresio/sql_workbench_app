import 'dart:convert';

import 'package:dbclientapp/model/query_model.dart';
import 'package:mobx/mobx.dart';

import 'query_repository.dart';

part 'query_store.g.dart';

class QueryStore = _QueryStore with _$QueryStore;

abstract class _QueryStore with Store {

  @observable
  String query = '';

  @action setQuery(String value) {
    query = value;
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

}