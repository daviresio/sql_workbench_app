// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryStore on _HistoryStore, Store {
  final _$historyListAtom = Atom(name: '_HistoryStore.historyList');

  @override
  List<dynamic> get historyList {
    _$historyListAtom.reportRead();
    return super.historyList;
  }

  @override
  set historyList(List<dynamic> value) {
    _$historyListAtom.reportWrite(value, super.historyList, () {
      super.historyList = value;
    });
  }

  final _$_HistoryStoreActionController =
      ActionController(name: '_HistoryStore');

  @override
  dynamic setHistoryList(List<dynamic> value) {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.setHistoryList');
    try {
      return super.setHistoryList(value);
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historyList: ${historyList}
    ''';
  }
}
