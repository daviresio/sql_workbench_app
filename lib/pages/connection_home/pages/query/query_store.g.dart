// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QueryStore on _QueryStore, Store {
  Computed<bool> _$isQueryInSingleTableComputed;

  @override
  bool get isQueryInSingleTable => (_$isQueryInSingleTableComputed ??=
          Computed<bool>(() => super.isQueryInSingleTable))
      .value;

  final _$querySavedAtom = Atom(name: '_QueryStore.querySaved');

  @override
  dynamic get querySaved {
    _$querySavedAtom.context.enforceReadPolicy(_$querySavedAtom);
    _$querySavedAtom.reportObserved();
    return super.querySaved;
  }

  @override
  set querySaved(dynamic value) {
    _$querySavedAtom.context.conditionallyRunInAction(() {
      super.querySaved = value;
      _$querySavedAtom.reportChanged();
    }, _$querySavedAtom, name: '${_$querySavedAtom.name}_set');
  }

  final _$typesAtom = Atom(name: '_QueryStore.types');

  @override
  List<TypesResponseQueryModel> get types {
    _$typesAtom.context.enforceReadPolicy(_$typesAtom);
    _$typesAtom.reportObserved();
    return super.types;
  }

  @override
  set types(List<TypesResponseQueryModel> value) {
    _$typesAtom.context.conditionallyRunInAction(() {
      super.types = value;
      _$typesAtom.reportChanged();
    }, _$typesAtom, name: '${_$typesAtom.name}_set');
  }

  final _$columnsAtom = Atom(name: '_QueryStore.columns');

  @override
  List<String> get columns {
    _$columnsAtom.context.enforceReadPolicy(_$columnsAtom);
    _$columnsAtom.reportObserved();
    return super.columns;
  }

  @override
  set columns(List<String> value) {
    _$columnsAtom.context.conditionallyRunInAction(() {
      super.columns = value;
      _$columnsAtom.reportChanged();
    }, _$columnsAtom, name: '${_$columnsAtom.name}_set');
  }

  final _$rowsAtom = Atom(name: '_QueryStore.rows');

  @override
  List<dynamic> get rows {
    _$rowsAtom.context.enforceReadPolicy(_$rowsAtom);
    _$rowsAtom.reportObserved();
    return super.rows;
  }

  @override
  set rows(List<dynamic> value) {
    _$rowsAtom.context.conditionallyRunInAction(() {
      super.rows = value;
      _$rowsAtom.reportChanged();
    }, _$rowsAtom, name: '${_$rowsAtom.name}_set');
  }

  final _$renderedRowsAtom = Atom(name: '_QueryStore.renderedRows');

  @override
  List<dynamic> get renderedRows {
    _$renderedRowsAtom.context.enforceReadPolicy(_$renderedRowsAtom);
    _$renderedRowsAtom.reportObserved();
    return super.renderedRows;
  }

  @override
  set renderedRows(List<dynamic> value) {
    _$renderedRowsAtom.context.conditionallyRunInAction(() {
      super.renderedRows = value;
      _$renderedRowsAtom.reportChanged();
    }, _$renderedRowsAtom, name: '${_$renderedRowsAtom.name}_set');
  }

  final _$onTopAtom = Atom(name: '_QueryStore.onTop');

  @override
  bool get onTop {
    _$onTopAtom.context.enforceReadPolicy(_$onTopAtom);
    _$onTopAtom.reportObserved();
    return super.onTop;
  }

  @override
  set onTop(bool value) {
    _$onTopAtom.context.conditionallyRunInAction(() {
      super.onTop = value;
      _$onTopAtom.reportChanged();
    }, _$onTopAtom, name: '${_$onTopAtom.name}_set');
  }

  final _$columnSortIndexAtom = Atom(name: '_QueryStore.columnSortIndex');

  @override
  int get columnSortIndex {
    _$columnSortIndexAtom.context.enforceReadPolicy(_$columnSortIndexAtom);
    _$columnSortIndexAtom.reportObserved();
    return super.columnSortIndex;
  }

  @override
  set columnSortIndex(int value) {
    _$columnSortIndexAtom.context.conditionallyRunInAction(() {
      super.columnSortIndex = value;
      _$columnSortIndexAtom.reportChanged();
    }, _$columnSortIndexAtom, name: '${_$columnSortIndexAtom.name}_set');
  }

  final _$columnSortAscAtom = Atom(name: '_QueryStore.columnSortAsc');

  @override
  bool get columnSortAsc {
    _$columnSortAscAtom.context.enforceReadPolicy(_$columnSortAscAtom);
    _$columnSortAscAtom.reportObserved();
    return super.columnSortAsc;
  }

  @override
  set columnSortAsc(bool value) {
    _$columnSortAscAtom.context.conditionallyRunInAction(() {
      super.columnSortAsc = value;
      _$columnSortAscAtom.reportChanged();
    }, _$columnSortAscAtom, name: '${_$columnSortAscAtom.name}_set');
  }

  final _$lastQueryExecutedAtom = Atom(name: '_QueryStore.lastQueryExecuted');

  @override
  String get lastQueryExecuted {
    _$lastQueryExecutedAtom.context.enforceReadPolicy(_$lastQueryExecutedAtom);
    _$lastQueryExecutedAtom.reportObserved();
    return super.lastQueryExecuted;
  }

  @override
  set lastQueryExecuted(String value) {
    _$lastQueryExecutedAtom.context.conditionallyRunInAction(() {
      super.lastQueryExecuted = value;
      _$lastQueryExecutedAtom.reportChanged();
    }, _$lastQueryExecutedAtom, name: '${_$lastQueryExecutedAtom.name}_set');
  }

  final _$fetchQueryAsyncAction = AsyncAction('fetchQuery');

  @override
  Future fetchQuery(QueryModel query) {
    return _$fetchQueryAsyncAction.run(() => super.fetchQuery(query));
  }

  final _$_QueryStoreActionController = ActionController(name: '_QueryStore');

  @override
  dynamic setQuery(String value) {
    final _$actionInfo = _$_QueryStoreActionController.startAction();
    try {
      return super.setQuery(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOnTop(dynamic value) {
    final _$actionInfo = _$_QueryStoreActionController.startAction();
    try {
      return super.setOnTop(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTableSort(int position, bool asc) {
    final _$actionInfo = _$_QueryStoreActionController.startAction();
    try {
      return super.changeTableSort(position, asc);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRenderedRows() {
    final _$actionInfo = _$_QueryStoreActionController.startAction();
    try {
      return super.setRenderedRows();
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastQueryExecuted(String value) {
    final _$actionInfo = _$_QueryStoreActionController.startAction();
    try {
      return super.setLastQueryExecuted(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'querySaved: ${querySaved.toString()},types: ${types.toString()},columns: ${columns.toString()},rows: ${rows.toString()},renderedRows: ${renderedRows.toString()},onTop: ${onTop.toString()},columnSortIndex: ${columnSortIndex.toString()},columnSortAsc: ${columnSortAsc.toString()},lastQueryExecuted: ${lastQueryExecuted.toString()},isQueryInSingleTable: ${isQueryInSingleTable.toString()}';
    return '{$string}';
  }
}
