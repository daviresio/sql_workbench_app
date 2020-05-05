// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_result_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DownloadResultStore on _DownloadResultStore, Store {
  final _$isCsvSelectedAtom = Atom(name: '_DownloadResultStore.isCsvSelected');

  @override
  bool get isCsvSelected {
    _$isCsvSelectedAtom.context.enforceReadPolicy(_$isCsvSelectedAtom);
    _$isCsvSelectedAtom.reportObserved();
    return super.isCsvSelected;
  }

  @override
  set isCsvSelected(bool value) {
    _$isCsvSelectedAtom.context.conditionallyRunInAction(() {
      super.isCsvSelected = value;
      _$isCsvSelectedAtom.reportChanged();
    }, _$isCsvSelectedAtom, name: '${_$isCsvSelectedAtom.name}_set');
  }

  final _$isDownloadSelectedAtom =
      Atom(name: '_DownloadResultStore.isDownloadSelected');

  @override
  bool get isDownloadSelected {
    _$isDownloadSelectedAtom.context
        .enforceReadPolicy(_$isDownloadSelectedAtom);
    _$isDownloadSelectedAtom.reportObserved();
    return super.isDownloadSelected;
  }

  @override
  set isDownloadSelected(bool value) {
    _$isDownloadSelectedAtom.context.conditionallyRunInAction(() {
      super.isDownloadSelected = value;
      _$isDownloadSelectedAtom.reportChanged();
    }, _$isDownloadSelectedAtom, name: '${_$isDownloadSelectedAtom.name}_set');
  }

  final _$_DownloadResultStoreActionController =
      ActionController(name: '_DownloadResultStore');

  @override
  void setIsCsvSelected(bool value) {
    final _$actionInfo = _$_DownloadResultStoreActionController.startAction();
    try {
      return super.setIsCsvSelected(value);
    } finally {
      _$_DownloadResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDownloadSelected(bool value) {
    final _$actionInfo = _$_DownloadResultStoreActionController.startAction();
    try {
      return super.setIsDownloadSelected(value);
    } finally {
      _$_DownloadResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isCsvSelected: ${isCsvSelected.toString()},isDownloadSelected: ${isDownloadSelected.toString()}';
    return '{$string}';
  }
}
