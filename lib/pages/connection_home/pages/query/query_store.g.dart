// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QueryStore on _QueryStore, Store {
  Computed<bool> _$isQueryInSingleTableComputed;

  @override
  bool get isQueryInSingleTable => (_$isQueryInSingleTableComputed ??=
          Computed<bool>(() => super.isQueryInSingleTable,
              name: '_QueryStore.isQueryInSingleTable'))
      .value;

  final _$querySavedAtom = Atom(name: '_QueryStore.querySaved');

  @override
  dynamic get querySaved {
    _$querySavedAtom.reportRead();
    return super.querySaved;
  }

  @override
  set querySaved(dynamic value) {
    _$querySavedAtom.reportWrite(value, super.querySaved, () {
      super.querySaved = value;
    });
  }

  final _$typesAtom = Atom(name: '_QueryStore.types');

  @override
  List<TypesResponseQueryModel> get types {
    _$typesAtom.reportRead();
    return super.types;
  }

  @override
  set types(List<TypesResponseQueryModel> value) {
    _$typesAtom.reportWrite(value, super.types, () {
      super.types = value;
    });
  }

  final _$columnsAtom = Atom(name: '_QueryStore.columns');

  @override
  List<String> get columns {
    _$columnsAtom.reportRead();
    return super.columns;
  }

  @override
  set columns(List<String> value) {
    _$columnsAtom.reportWrite(value, super.columns, () {
      super.columns = value;
    });
  }

  final _$rowsAtom = Atom(name: '_QueryStore.rows');

  @override
  List<dynamic> get rows {
    _$rowsAtom.reportRead();
    return super.rows;
  }

  @override
  set rows(List<dynamic> value) {
    _$rowsAtom.reportWrite(value, super.rows, () {
      super.rows = value;
    });
  }

  final _$renderedRowsAtom = Atom(name: '_QueryStore.renderedRows');

  @override
  List<dynamic> get renderedRows {
    _$renderedRowsAtom.reportRead();
    return super.renderedRows;
  }

  @override
  set renderedRows(List<dynamic> value) {
    _$renderedRowsAtom.reportWrite(value, super.renderedRows, () {
      super.renderedRows = value;
    });
  }

  final _$onTopAtom = Atom(name: '_QueryStore.onTop');

  @override
  bool get onTop {
    _$onTopAtom.reportRead();
    return super.onTop;
  }

  @override
  set onTop(bool value) {
    _$onTopAtom.reportWrite(value, super.onTop, () {
      super.onTop = value;
    });
  }

  final _$columnSortIndexAtom = Atom(name: '_QueryStore.columnSortIndex');

  @override
  int get columnSortIndex {
    _$columnSortIndexAtom.reportRead();
    return super.columnSortIndex;
  }

  @override
  set columnSortIndex(int value) {
    _$columnSortIndexAtom.reportWrite(value, super.columnSortIndex, () {
      super.columnSortIndex = value;
    });
  }

  final _$columnSortAscAtom = Atom(name: '_QueryStore.columnSortAsc');

  @override
  bool get columnSortAsc {
    _$columnSortAscAtom.reportRead();
    return super.columnSortAsc;
  }

  @override
  set columnSortAsc(bool value) {
    _$columnSortAscAtom.reportWrite(value, super.columnSortAsc, () {
      super.columnSortAsc = value;
    });
  }

  final _$lastQueryExecutedAtom = Atom(name: '_QueryStore.lastQueryExecuted');

  @override
  String get lastQueryExecuted {
    _$lastQueryExecutedAtom.reportRead();
    return super.lastQueryExecuted;
  }

  @override
  set lastQueryExecuted(String value) {
    _$lastQueryExecutedAtom.reportWrite(value, super.lastQueryExecuted, () {
      super.lastQueryExecuted = value;
    });
  }

  final _$currentScrolledPositionAtom =
      Atom(name: '_QueryStore.currentScrolledPosition');

  @override
  double get currentScrolledPosition {
    _$currentScrolledPositionAtom.reportRead();
    return super.currentScrolledPosition;
  }

  @override
  set currentScrolledPosition(double value) {
    _$currentScrolledPositionAtom
        .reportWrite(value, super.currentScrolledPosition, () {
      super.currentScrolledPosition = value;
    });
  }

  final _$fetchQueryAsyncAction = AsyncAction('_QueryStore.fetchQuery');

  @override
  Future fetchQuery(QueryModel query) {
    return _$fetchQueryAsyncAction.run(() => super.fetchQuery(query));
  }

  final _$_QueryStoreActionController = ActionController(name: '_QueryStore');

  @override
  dynamic setQuery(String value) {
    final _$actionInfo =
        _$_QueryStoreActionController.startAction(name: '_QueryStore.setQuery');
    try {
      return super.setQuery(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOnTop(dynamic value) {
    final _$actionInfo =
        _$_QueryStoreActionController.startAction(name: '_QueryStore.setOnTop');
    try {
      return super.setOnTop(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTableSort(int position, bool asc) {
    final _$actionInfo = _$_QueryStoreActionController.startAction(
        name: '_QueryStore.changeTableSort');
    try {
      return super.changeTableSort(position, asc);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRenderedRows() {
    final _$actionInfo = _$_QueryStoreActionController.startAction(
        name: '_QueryStore.setRenderedRows');
    try {
      return super.setRenderedRows();
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastQueryExecuted(String value) {
    final _$actionInfo = _$_QueryStoreActionController.startAction(
        name: '_QueryStore.setLastQueryExecuted');
    try {
      return super.setLastQueryExecuted(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentScrolledPosition(double value) {
    final _$actionInfo = _$_QueryStoreActionController.startAction(
        name: '_QueryStore.setCurrentScrolledPosition');
    try {
      return super.setCurrentScrolledPosition(value);
    } finally {
      _$_QueryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
querySaved: ${querySaved},
types: ${types},
columns: ${columns},
rows: ${rows},
renderedRows: ${renderedRows},
onTop: ${onTop},
columnSortIndex: ${columnSortIndex},
columnSortAsc: ${columnSortAsc},
lastQueryExecuted: ${lastQueryExecuted},
currentScrolledPosition: ${currentScrolledPosition},
isQueryInSingleTable: ${isQueryInSingleTable}
    ''';
  }
}
