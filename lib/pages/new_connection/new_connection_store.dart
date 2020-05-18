import 'package:dbclientapp/database/database.dart';
import 'package:mobx/mobx.dart';

import 'new_connection_constants.dart';

part 'new_connection_store.g.dart';

class NewConnectionStore = _NewConnectionStore with _$NewConnectionStore;

abstract class _NewConnectionStore with Store {

  @observable
  dynamic connection = Connection(ssh: false);

  @action
  void setId(int value) {
    connection = connection.copyWith(id: value);
  }

  @action
  void setName(String value) {
    connection = connection.copyWith(name: value);
  }

  @action
  void setVendor(String value) {
    connection = connection.copyWith(vendor: value);
  }

  @action
  void setHost(String value) {
    connection = connection.copyWith(host: value);
  }

  @action
  void setPort(String value) {
    connection = connection.copyWith(port: value);
  }

  @action
  void setDatabaseName(String value) {
    connection = connection.copyWith(databaseName: value);
  }

  @action
  void setSchema(String value) {
    connection = connection.copyWith(schema: value);
  }

  @action
  void setUser(String value) {
    connection = connection.copyWith(user: value);
  }

  @action
  void setPassword(String value) {
    connection = connection.copyWith(password: value);
  }

  @action
  void setSsh(bool value) {
    connection = connection.copyWith(ssh: value);
  }

  @action
  void initForm([Connection connection]) {
    this.connection = connection.copyWith(vendor: POSTGRES_NAME);
  }


  Future<Connection> loadData(int id) {
    return Database.instance.connectionDao.find(id).then((Connection onValue) {
      initForm(onValue);
      return onValue;
    });
  }
}
