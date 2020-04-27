import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/database/model/ConnectionWithInfo.dart';
import 'package:mobx/mobx.dart';

part 'connection_home_store.g.dart';

class ConnectionHomeStore = _ConnectionHomeStore with _$ConnectionHomeStore;

abstract class _ConnectionHomeStore with Store {

  @observable
  int id;

  @observable
  dynamic connectionsWithInfo;

  @action
  setConnectionsWithInfo(int id) {
    this.id = id;

    Database.instance.connectionDao.findConnectionWithInfo(id).listen((ConnectionsWithInfo onData) {
      connectionsWithInfo = onData;
    });
  }

}