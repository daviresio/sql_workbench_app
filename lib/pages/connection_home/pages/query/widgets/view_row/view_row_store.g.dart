// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_row_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewRowStore on _ViewRowStore, Store {
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

  final _$_ViewRowStoreActionController =
      ActionController(name: '_ViewRowStore');

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
  void setItems(Map<String, dynamic> value) {
    final _$actionInfo = _$_ViewRowStoreActionController.startAction();
    try {
      return super.setItems(value);
    } finally {
      _$_ViewRowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'editMode: ${editMode.toString()},items: ${items.toString()}';
    return '{$string}';
  }
}
