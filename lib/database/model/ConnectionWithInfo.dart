import 'package:dbclientapp/database/database.dart';

class ConnectionsWithInfo {
  final Connection connection;
  final DatabaseInfo databaseInfo;

  ConnectionsWithInfo(this.connection, this.databaseInfo);

  @override
  String toString() {
    return 'ConnectionsWithInfo{connection: $connection, databaseInfo: $databaseInfo}';
  }

}