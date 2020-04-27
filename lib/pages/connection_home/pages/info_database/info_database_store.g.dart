// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_database_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfoDatabaseStore on _InfoDatabaseStore, Store {
  final _$databasesAtom = Atom(name: '_InfoDatabaseStore.databases');

  @override
  List<String> get databases {
    _$databasesAtom.context.enforceReadPolicy(_$databasesAtom);
    _$databasesAtom.reportObserved();
    return super.databases;
  }

  @override
  set databases(List<String> value) {
    _$databasesAtom.context.conditionallyRunInAction(() {
      super.databases = value;
      _$databasesAtom.reportChanged();
    }, _$databasesAtom, name: '${_$databasesAtom.name}_set');
  }

  final _$schemasAtom = Atom(name: '_InfoDatabaseStore.schemas');

  @override
  List<String> get schemas {
    _$schemasAtom.context.enforceReadPolicy(_$schemasAtom);
    _$schemasAtom.reportObserved();
    return super.schemas;
  }

  @override
  set schemas(List<String> value) {
    _$schemasAtom.context.conditionallyRunInAction(() {
      super.schemas = value;
      _$schemasAtom.reportChanged();
    }, _$schemasAtom, name: '${_$schemasAtom.name}_set');
  }

  final _$tablesAtom = Atom(name: '_InfoDatabaseStore.tables');

  @override
  List<String> get tables {
    _$tablesAtom.context.enforceReadPolicy(_$tablesAtom);
    _$tablesAtom.reportObserved();
    return super.tables;
  }

  @override
  set tables(List<String> value) {
    _$tablesAtom.context.conditionallyRunInAction(() {
      super.tables = value;
      _$tablesAtom.reportChanged();
    }, _$tablesAtom, name: '${_$tablesAtom.name}_set');
  }

  final _$viewsAtom = Atom(name: '_InfoDatabaseStore.views');

  @override
  List<String> get views {
    _$viewsAtom.context.enforceReadPolicy(_$viewsAtom);
    _$viewsAtom.reportObserved();
    return super.views;
  }

  @override
  set views(List<String> value) {
    _$viewsAtom.context.conditionallyRunInAction(() {
      super.views = value;
      _$viewsAtom.reportChanged();
    }, _$viewsAtom, name: '${_$viewsAtom.name}_set');
  }

  final _$storeProceduresAtom =
      Atom(name: '_InfoDatabaseStore.storeProcedures');

  @override
  List<String> get storeProcedures {
    _$storeProceduresAtom.context.enforceReadPolicy(_$storeProceduresAtom);
    _$storeProceduresAtom.reportObserved();
    return super.storeProcedures;
  }

  @override
  set storeProcedures(List<String> value) {
    _$storeProceduresAtom.context.conditionallyRunInAction(() {
      super.storeProcedures = value;
      _$storeProceduresAtom.reportChanged();
    }, _$storeProceduresAtom, name: '${_$storeProceduresAtom.name}_set');
  }

  final _$functionsAtom = Atom(name: '_InfoDatabaseStore.functions');

  @override
  List<String> get functions {
    _$functionsAtom.context.enforceReadPolicy(_$functionsAtom);
    _$functionsAtom.reportObserved();
    return super.functions;
  }

  @override
  set functions(List<String> value) {
    _$functionsAtom.context.conditionallyRunInAction(() {
      super.functions = value;
      _$functionsAtom.reportChanged();
    }, _$functionsAtom, name: '${_$functionsAtom.name}_set');
  }

  final _$connectionAtom = Atom(name: '_InfoDatabaseStore.connection');

  @override
  dynamic get connection {
    _$connectionAtom.context.enforceReadPolicy(_$connectionAtom);
    _$connectionAtom.reportObserved();
    return super.connection;
  }

  @override
  set connection(dynamic value) {
    _$connectionAtom.context.conditionallyRunInAction(() {
      super.connection = value;
      _$connectionAtom.reportChanged();
    }, _$connectionAtom, name: '${_$connectionAtom.name}_set');
  }

  final _$_InfoDatabaseStoreActionController =
      ActionController(name: '_InfoDatabaseStore');

  @override
  dynamic setDatabases(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setDatabases(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSchemas(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setSchemas(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTables(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setTables(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setViews(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setViews(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStoreProcedures(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setStoreProcedures(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFunctions(List<String> value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setFunctions(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConnection(dynamic value) {
    final _$actionInfo = _$_InfoDatabaseStoreActionController.startAction();
    try {
      return super.setConnection(value);
    } finally {
      _$_InfoDatabaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'databases: ${databases.toString()},schemas: ${schemas.toString()},tables: ${tables.toString()},views: ${views.toString()},storeProcedures: ${storeProcedures.toString()},functions: ${functions.toString()},connection: ${connection.toString()}';
    return '{$string}';
  }
}
