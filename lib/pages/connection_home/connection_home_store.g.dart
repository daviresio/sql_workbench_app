// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionHomeStore on _ConnectionHomeStore, Store {
  final _$idAtom = Atom(name: '_ConnectionHomeStore.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$connectionsWithInfoAtom =
      Atom(name: '_ConnectionHomeStore.connectionsWithInfo');

  @override
  dynamic get connectionsWithInfo {
    _$connectionsWithInfoAtom.context
        .enforceReadPolicy(_$connectionsWithInfoAtom);
    _$connectionsWithInfoAtom.reportObserved();
    return super.connectionsWithInfo;
  }

  @override
  set connectionsWithInfo(dynamic value) {
    _$connectionsWithInfoAtom.context.conditionallyRunInAction(() {
      super.connectionsWithInfo = value;
      _$connectionsWithInfoAtom.reportChanged();
    }, _$connectionsWithInfoAtom,
        name: '${_$connectionsWithInfoAtom.name}_set');
  }

  final _$_ConnectionHomeStoreActionController =
      ActionController(name: '_ConnectionHomeStore');

  @override
  dynamic setConnectionsWithInfo(int id) {
    final _$actionInfo = _$_ConnectionHomeStoreActionController.startAction();
    try {
      return super.setConnectionsWithInfo(id);
    } finally {
      _$_ConnectionHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},connectionsWithInfo: ${connectionsWithInfo.toString()}';
    return '{$string}';
  }
}
