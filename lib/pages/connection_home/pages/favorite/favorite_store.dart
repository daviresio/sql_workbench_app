import 'package:dbclientapp/database/database.dart';
import 'package:mobx/mobx.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {

  @observable
  List<dynamic> favoriteList = [];

  @action
  setFavoriteList(List<QuerySaved> value) {
    favoriteList = List.from(value);
  }

  initData(int databaseInfoId) {
    Database.instance.querySavedDao.listFavorite(databaseInfoId).listen((List<QuerySaved> onData) {
      setFavoriteList(List<QuerySaved>.from(onData.reversed));
    });
  }

}