import 'package:dbclientapp/database/model/ConnectionWithInfo.dart';
import 'package:dbclientapp/database/table/connection_table.dart';
import 'package:dbclientapp/database/table/database_info_table.dart';
import 'package:moor/moor.dart';

import '../database.dart';

part 'connection_dao.g.dart';

@UseDao(tables: [Connections, DatabaseInfos])
class ConnectionDao extends DatabaseAccessor<Database> with _$ConnectionDaoMixin {

  final Database db;

  ConnectionDao(this.db) : super(db);

  Future<Connection> find(int id) => (select(connections)..where((t) => t.id.equals(id))).getSingle();

  Stream<List<Connection>> list() => select(connections).watch();

  Future add(Connection connection) => into(connections).insert(connection.copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now()));

  Future edit(Connection connection) => update(connections).replace(connection.copyWith(updatedAt: DateTime.now()));

  Future remove(id) => (delete(connections)..where((t) => t.id.equals(id))).go();



   Stream<ConnectionsWithInfo> findConnectionWithInfo(int id) {
     var query = (select(connections)..where((t) => t.id.equals(id))).join([
       leftOuterJoin(databaseInfos, databaseInfos.id.equalsExp(connections.databaseInfoId))
     ]).getSingle().then((row) => ConnectionsWithInfo(row.readTable(connections), row.readTable(databaseInfos))).asStream();
     return query;
   }

}