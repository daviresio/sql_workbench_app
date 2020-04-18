import 'package:dbclientapp/database/table/database_info_table.dart';
import 'package:moor/moor.dart';

import '../database.dart';

part 'database_info_dao.g.dart';

@UseDao(tables: [DatabaseInfos])
class DatabaseInfoDao extends DatabaseAccessor<Database> with _$DatabaseInfoDaoMixin {

  final Database db;

  DatabaseInfoDao(this.db) : super(db);

  Future<DatabaseInfo> find(int id) => (select(databaseInfos)..where((t) => t.id.equals(id))).getSingle();

  Stream<List<DatabaseInfo>> list() => select(databaseInfos).watch();

  Future add(DatabaseInfo databaseInfo) => into(databaseInfos).insert(databaseInfo.copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now()));

  Future edit(DatabaseInfo databaseInfo) => update(databaseInfos).replace(databaseInfo.copyWith(updatedAt: DateTime.now()));

  Future remove(id) => (delete(databaseInfos)..where((t) => t.id.equals(id))).go();

}