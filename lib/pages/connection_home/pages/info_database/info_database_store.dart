import 'dart:async';

import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/database/model/ConnectionWithInfo.dart';
import 'package:dbclientapp/util/converter_util.dart';
import 'package:mobx/mobx.dart';

part 'info_database_store.g.dart';

class InfoDatabaseStore = _InfoDatabaseStore with _$InfoDatabaseStore;

abstract class _InfoDatabaseStore with Store {

  @observable
  List<String> databases = [];

  @observable
  List<String> schemas = [];

  @observable
  List<String> tables = [];

  @observable
  List<String> views = [];

  @observable
  List<String> storeProcedures = [];

  @observable
  List<String> functions = [];

  @action
  setDatabases(List<String> value) {
    databases = List.from(value);
  }

  @action
  setSchemas(List<String> value) {
    schemas = List.from(value);
  }

  @action
  setTables(List<String> value) {
    tables = List.from(value);
  }

  @action
  setViews(List<String> value) {
    views = List.from(value);
  }

  @action
  setStoreProcedures(List<String> value) {
    storeProcedures = List.from(value);
  }

  @action
  setFunctions(List<String> value) {
    functions = List.from(value);
  }

  @observable
  dynamic connection = Connection();

  @action
  setConnection(Connection value) {
    connection = value;
  }

  initData(int id) {
    Database.instance.connectionDao.findConnectionWithInfo(id).listen((ConnectionsWithInfo onData) {
      setDatabases(ConverterUtil.stringToList(onData.databaseInfo.databases));
      setSchemas(ConverterUtil.stringToList(onData.databaseInfo.schemas));
      setTables(ConverterUtil.stringToList(onData.databaseInfo.tables));
      setViews(ConverterUtil.stringToList(onData.databaseInfo.views));
      setStoreProcedures(ConverterUtil.stringToList(onData.databaseInfo.storeProcedures));
      setFunctions(ConverterUtil.stringToList(onData.databaseInfo.functions));

      setConnection(onData.connection);

    });
  }




}