// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  final _$favoriteListAtom = Atom(name: '_FavoriteStore.favoriteList');

  @override
  List<dynamic> get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(List<dynamic> value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  final _$_FavoriteStoreActionController =
      ActionController(name: '_FavoriteStore');

  @override
  dynamic setFavoriteList(List<dynamic> value) {
    final _$actionInfo = _$_FavoriteStoreActionController.startAction(
        name: '_FavoriteStore.setFavoriteList');
    try {
      return super.setFavoriteList(value);
    } finally {
      _$_FavoriteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteList: ${favoriteList}
    ''';
  }
}
