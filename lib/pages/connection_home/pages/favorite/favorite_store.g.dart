// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  final _$favoriteListAtom = Atom(name: '_FavoriteStore.favoriteList');

  @override
  List<dynamic> get favoriteList {
    _$favoriteListAtom.context.enforceReadPolicy(_$favoriteListAtom);
    _$favoriteListAtom.reportObserved();
    return super.favoriteList;
  }

  @override
  set favoriteList(List<dynamic> value) {
    _$favoriteListAtom.context.conditionallyRunInAction(() {
      super.favoriteList = value;
      _$favoriteListAtom.reportChanged();
    }, _$favoriteListAtom, name: '${_$favoriteListAtom.name}_set');
  }

  final _$_FavoriteStoreActionController =
      ActionController(name: '_FavoriteStore');

  @override
  dynamic setFavoriteList(List<dynamic> value) {
    final _$actionInfo = _$_FavoriteStoreActionController.startAction();
    try {
      return super.setFavoriteList(value);
    } finally {
      _$_FavoriteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'favoriteList: ${favoriteList.toString()}';
    return '{$string}';
  }
}
