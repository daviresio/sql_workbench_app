// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewConnectionStore on _NewConnectionStore, Store {
  final _$connectionAtom = Atom(name: '_NewConnectionStore.connection');

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

  final _$_NewConnectionStoreActionController =
      ActionController(name: '_NewConnectionStore');

  @override
  void setId(int value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setId');
    try {
      return super.setId(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVendor(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setVendor');
    try {
      return super.setVendor(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHost(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setHost');
    try {
      return super.setHost(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPort(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setPort');
    try {
      return super.setPort(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDatabaseName(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setDatabaseName');
    try {
      return super.setDatabaseName(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSchema(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setSchema');
    try {
      return super.setSchema(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSsh(bool value) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.setSsh');
    try {
      return super.setSsh(value);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initForm([dynamic connection]) {
    final _$actionInfo = _$_NewConnectionStoreActionController.startAction(
        name: '_NewConnectionStore.initForm');
    try {
      return super.initForm(connection);
    } finally {
      _$_NewConnectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connection: ${connection}
    ''';
  }
}
