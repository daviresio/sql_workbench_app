// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_database_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfoDatabaseStore on _InfoDatabaseStore, Store {
  final _$databasesAtom = Atom(name: '_InfoDatabaseStore.databases');

  @override
  List<String> get databases {
    _$databasesAtom.reportRead();
    return super.databases;
  }

  @override
  set databases(List<String> value) {
    _$databasesAtom.reportWrite(value, super.databases, () {
      super.databases = value;
    });
  }

  final _$schemasAtom = Atom(name: '_InfoDatabaseStore.schemas');

  @override
  List<String> get schemas {
    _$schemasAtom.reportRead();
    return super.schemas;
  }

  @override
  set schemas(List<String> value) {
    _$schemasAtom.reportWrite(value, super.schemas, () {
      super.schemas = value;
    });
  }

  final _$tablesAtom = Atom(name: '_InfoDatabaseStore.tables');

  @override
  List<String> get tables {
    _$tablesAtom.reportRead();
    return super.tables;
  }

  @override
  set tables(List<String> value) {
    _$tablesAtom.reportWrite(value, super.tables, () {
      super.tables = value;
    });
  }

  final _$viewsAtom = Atom(name: '_InfoDatabaseStore.views');

  @override
  List<String> get views {
    _$viewsAtom.reportRead();
    return super.views;
  }

  @override
  set views(List<String> value) {
    _$viewsAtom.reportWrite(value, super.views, () {
      super.views = value;
    });
  }

  final _$storeProceduresAtom =
      Atom(name: '_InfoDatabaseStore.storeProcedures');

  @override
  List<String> get storeProcedures {
    _$storeProceduresAtom.reportRead();
    return super.storeProcedures;
  }

  @override
  set storeProcedures(List<String> value) {
    _$storeProceduresAtom.reportWrite(value, super.storeProcedures, () {
      super.storeProcedures = value;
    });
  }

  final _$functionsAtom = Atom(name: '_InfoDatabaseStore.functions');

  @override
  List<String> get functions {
    _$functionsAtom.reportRead();
    return super.functions;
  }

  @override
  set functions(List<String> value) {
    _$functionsAtom.reportWrite(value, super.functions, () {
      super.functions = value;
    });
  }

  final _$connectionAtom = Atom(name: '_InfoDatabaseStore.connection');

  @override
  dynamic get connection {
    _$connectionAtom.reportRead();
    return super.connection;
  }

  @override
  set connection(dynamic value) {
    _$connectionAtom.reportWrite(value, super.connection, () {
      super.connection = value;
    });
  }

  final _$_InfoDatabaseStoreActionController =
      ActionController(name: '_InfoDatabaseStore');

  @override
  dynamic setDatabases(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setDatabases');
    try {
      return super.setDatabases(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSchemas(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setSchemas');
    try {
      return super.setSchemas(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTables(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setTables');
    try {
      return super.setTables(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setViews(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setViews');
    try {
      return super.setViews(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStoreProcedures(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setStoreProcedures');
    try {
      return super.setStoreProcedures(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFunctions(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setFunctions');
    try {
      return super.setFunctions(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConnection(dynamic value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction(
        name: '_InfoDatabaseStore.setConnection');
    try {
      return super.setConnection(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
databases: ${databases},
schemas: ${schemas},
tables: ${tables},
views: ${views},
storeProcedures: ${storeProcedures},
functions: ${functions},
connection: ${connection}
    ''';
  }
}
