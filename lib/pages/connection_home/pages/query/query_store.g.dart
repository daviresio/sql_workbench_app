// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QueryStore on _QueryStore, Store {
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
  String toString() {
    final string =
        'querySaved: ${querySaved.toString()},columns: ${columns.toString()},rows: ${rows.toString()},onTop: ${onTop.toString()}';
    return '{$string}';
  }
}
