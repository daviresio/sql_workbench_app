import 'package:dbclientapp/database/database.dart';
import 'package:mobx/mobx.dart';

part 'new_connection_store.g.dart';

class NewConnectionStore = _NewConnectionStore with _$NewConnectionStore;

abstract class _NewConnectionStore with Store {

  @observable
  int id = null;

  @observable
  String name = '';

  @observable
  String vendor = null;

  @observable
  String host = '';

  @observable
  String port = '';

  @observable
  String databaseName = '';

  @observable
  String schema = '';

  @observable
  String user = '';

  @observable
  String password = '';

  @observable
  bool ssh = false;


  @action
  void setId(int value) {
    id = value;
  }

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setVendor(String value) {
    vendor = value;
  }

  @action
  void setHost(String value) {
    host = value;
  }

  @action
  void setPort(String value) {
    port = value;
  }

  @action
  void setDatabaseName(String value) {
    databaseName = value;
  }

  @action
  void setSchema(String value) {
    schema = value;
  }

  @action
  void setUser(String value) {
    user = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setSsh(bool value) {
    ssh = value;
  }

  @action
  void initForm([Connection connection]) {
    connection ??= Connection();

    id = connection.id;
    name = connection.name;
    vendor = connection.vendor;
    host = connection.host;
    port = connection.port;
    databaseName = connection.databaseName;
    schema = connection.schema;
    user = connection.user;
    password = connection.password;
    ssh = connection.ssh;
  }

  Connection getConnection() {

    Connection connection = Connection(
      id: id,
      name: name,
      vendor: vendor,
      host: host,
      port: port,
      databaseName: databaseName,
      user: user,
      password: password,
      ssh: ssh,
    );

    return connection;
  }

}