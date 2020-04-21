import 'package:dbclientapp/database/database.dart';

class ConnectionModel {
  String host;
  String port;
  String user;
  String password;
  String databaseName;

  ConnectionModel({this.host, this.port, this.user, this.password, this.databaseName});

  ConnectionModel.fromTable(Connection connection) {
    host = connection.host;
    port = connection.port;
    user = connection.user;
    password = connection.password;
    databaseName = connection.databaseName;
  }

  Map<String, dynamic> toJson ()=> {
    'host': host,
    'port': port,
    'user': user,
    'password': password,
    'databaseName': databaseName
  };

}