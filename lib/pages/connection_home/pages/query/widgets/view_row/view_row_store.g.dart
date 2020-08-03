// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_row_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewRowStore on _ViewRowStore, Store {
  final _$isNewRecordAtom = Atom(name: '_ViewRowStore.isNewRecord');

  @override
  bool get isNewRecord {
    _$isNewRecordAtom.reportRead();
    return super.isNewRecord;
  }

  @override
  set isNewRecord(bool value) {
    _$isNewRecordAtom.reportWrite(value, super.isNewRecord, () {
      super.isNewRecord = value;
    });
  }

  final _$editModeAtom = Atom(name: '_ViewRowStore.editMode');

  @override
  bool get editMode {
    _$editModeAtom.reportRead();
    return super.editMode;
  }

  @override
  set editMode(bool value) {
    _$editModeAtom.reportWrite(value, super.editMode, () {
      super.editMode = value;
    });
  }

  final _$itemsAtom = Atom(name: '_ViewRowStore.items');

  @override
  Map<String, dynamic> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(Map<String, dynamic> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$originalItemsAtom = Atom(name: '_ViewRowStore.originalItems');

  @override
  Map<String, dynamic> get originalItems {
    _$originalItemsAtom.reportRead();
    return super.originalItems;
  }

  @override
  set originalItems(Map<String, dynamic> value) {
    _$originalItemsAtom.reportWrite(value, super.originalItems, () {
      super.originalItems = value;
    });
  }

  final _$typesAtom = Atom(name: '_ViewRowStore.types');

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

  final _$_ViewRowStoreActionController =
      ActionController(name: '_ViewRowStore');

  @override
  void setIsNewRecord(bool value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction(
        name: '_ViewRowStore.setIsNewRecord');
    try {
      return super.setIsNewRecord(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditMode(bool value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction(
        name: '_ViewRowStore.setEditMode');
    try {
      return super.setEditMode(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValue(String key, dynamic value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction(
        name: '_ViewRowStore.changeValue');
    try {
      return super.changeValue(key, value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOriginalValue(Map<String, dynamic> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction(
        name: '_ViewRowStore.setOriginalValue');
    try {
      return super.setOriginalValue(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItems(Map<String, dynamic> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction(
        name: '_ViewRowStore.setItems');
    try {
      return super.setItems(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypes(List<TypesResponseQueryModel> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction(
        name: '_ViewRowStore.setTypes');
    try {
      return super.setTypes(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNewRecord: ${isNewRecord},
editMode: ${editMode},
items: ${items},
originalItems: ${originalItems},
types: ${types}
    ''';
  }
}
