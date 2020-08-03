// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionHomeStore on _ConnectionHomeStore, Store {
  final _$idAtom = Atom(name: '_ConnectionHomeStore.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$connectionsWithInfoAtom =
      Atom(name: '_ConnectionHomeStore.connectionsWithInfo');

  @override
  dynamic get connectionsWithInfo {
    _$connectionsWithInfoAtom.reportRead();
    return super.connectionsWithInfo;
  }

  @override
  set connectionsWithInfo(dynamic value) {
    _$connectionsWithInfoAtom.reportWrite(value, super.connectionsWithInfo, () {
      super.connectionsWithInfo = value;
    });
  }

  final _$_ConnectionHomeStoreActionController =
      ActionController(name: '_ConnectionHomeStore');

  @override
  dynamic setConnectionsWithInfo(int id) {
    final _$actionInfo = _$_ConnectionHomeStoreActionController.startAction(
        name: '_ConnectionHomeStore.setConnectionsWithInfo');
    try {
      return super.setConnectionsWithInfo(id);
    } finally {
      _$_ConnectionHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
connectionsWithInfo: ${connectionsWithInfo}
    ''';
  }
}
