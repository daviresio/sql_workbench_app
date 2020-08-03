// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_result_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DownloadResultStore on _DownloadResultStore, Store {
  final _$isCsvSelectedAtom = Atom(name: '_DownloadResultStore.isCsvSelected');

  @override
  bool get isCsvSelected {
    _$isCsvSelectedAtom.reportRead();
    return super.isCsvSelected;
  }

  @override
  set isCsvSelected(bool value) {
    _$isCsvSelectedAtom.reportWrite(value, super.isCsvSelected, () {
      super.isCsvSelected = value;
    });
  }

  final _$isDownloadSelectedAtom =
      Atom(name: '_DownloadResultStore.isDownloadSelected');

  @override
  bool get isDownloadSelected {
    _$isDownloadSelectedAtom.reportRead();
    return super.isDownloadSelected;
  }

  @override
  set isDownloadSelected(bool value) {
    _$isDownloadSelectedAtom.reportWrite(value, super.isDownloadSelected, () {
      super.isDownloadSelected = value;
    });
  }

  final _$_DownloadResultStoreActionController =
      ActionController(name: '_DownloadResultStore');

  @override
  void setIsCsvSelected(bool value) {
    final _$actionInfo = _$_DownloadResultStoreActionController.startAction(
        name: '_DownloadResultStore.setIsCsvSelected');
    try {
      return super.setIsCsvSelected(value);
    } finally {
      _$_DownloadResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDownloadSelected(bool value) {
    final _$actionInfo = _$_DownloadResultStoreActionController.startAction(
        name: '_DownloadResultStore.setIsDownloadSelected');
    try {
      return super.setIsDownloadSelected(value);
    } finally {
      _$_DownloadResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCsvSelected: ${isCsvSelected},
isDownloadSelected: ${isDownloadSelected}
    ''';
  }
}
