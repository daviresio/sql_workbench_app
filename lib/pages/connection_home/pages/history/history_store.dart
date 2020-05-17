import 'package:dbclientapp/database/database.dart';
import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryStore with _$HistoryStore;

abstract class _HistoryStore with Store {

  @observable
  List<dynamic> historyList = [];

  @action
  setHistoryList(List<QuerySaved> value) {
    historyList = List.from(value);
  }

  initData(int databaseInfoId) {
    Database.instance.querySavedDao.listHistory(databaseInfoId).listen((List<QuerySaved> onData) {
      setHistoryList(List<QuerySaved>.from(onData.reversed));
    });
  }

}