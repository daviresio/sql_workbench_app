// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_row_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewRowStore on _ViewRowStore, Store {
  final _$isNewRecordAtom = Atom(name: '_ViewRowStore.isNewRecord');

  @override
  bool get isNewRecord {
    _$isNewRecordAtom.context.enforceReadPolicy(_$isNewRecordAtom);
    _$isNewRecordAtom.reportObserved();
    return super.isNewRecord;
  }

  @override
  set isNewRecord(bool value) {
    _$isNewRecordAtom.context.conditionallyRunInAction(() {
      super.isNewRecord = value;
      _$isNewRecordAtom.reportChanged();
    }, _$isNewRecordAtom, name: '${_$isNewRecordAtom.name}_set');
  }

  final _$editModeAtom = Atom(name: '_ViewRowStore.editMode');

  @override
  bool get editMode {
    _$editModeAtom.context.enforceReadPolicy(_$editModeAtom);
    _$editModeAtom.reportObserved();
    return super.editMode;
  }

  @override
  set editMode(bool value) {
    _$editModeAtom.context.conditionallyRunInAction(() {
      super.editMode = value;
      _$editModeAtom.reportChanged();
    }, _$editModeAtom, name: '${_$editModeAtom.name}_set');
  }

  final _$itemsAtom = Atom(name: '_ViewRowStore.items');

  @override
  Map<String, dynamic> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(Map<String, dynamic> value) {
    _$itemsAtom.context.conditionallyRunInAction(() {
      super.items = value;
      _$itemsAtom.reportChanged();
    }, _$itemsAtom, name: '${_$itemsAtom.name}_set');
  }

  final _$originalItemsAtom = Atom(name: '_ViewRowStore.originalItems');

  @override
  Map<String, dynamic> get originalItems {
    _$originalItemsAtom.context.enforceReadPolicy(_$originalItemsAtom);
    _$originalItemsAtom.reportObserved();
    return super.originalItems;
  }

  @override
  set originalItems(Map<String, dynamic> value) {
    _$originalItemsAtom.context.conditionallyRunInAction(() {
      super.originalItems = value;
      _$originalItemsAtom.reportChanged();
    }, _$originalItemsAtom, name: '${_$originalItemsAtom.name}_set');
  }

  final _$typesAtom = Atom(name: '_ViewRowStore.types');

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

  final _$_ViewRowStoreActionController =
      ActionController(name: '_ViewRowStore');

  @override
  void setIsNewRecord(bool value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.setIsNewRecord(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditMode(bool value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.setEditMode(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValue(String key, dynamic value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.changeValue(key, value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOriginalValue(Map<String, dynamic> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.setOriginalValue(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItems(Map<String, dynamic> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.setItems(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypes(List<TypesResponseQueryModel> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.setTypes(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isNewRecord: ${isNewRecord.toString()},editMode: ${editMode.toString()},items: ${items.toString()},originalItems: ${originalItems.toString()},types: ${types.toString()}';
    return '{$string}';
  }
}
