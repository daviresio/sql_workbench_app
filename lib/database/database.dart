import 'dart:io';

import 'package:dbclientapp/database/dao/connection_dao.dart';
import 'package:dbclientapp/database/dao/query_saved_dao.dart';
import 'package:dbclientapp/database/table/connection_table.dart';
import 'package:dbclientapp/database/table/database_info_table.dart';
import 'package:dbclientapp/database/dao/database_info_dao.dart';
import 'package:dbclientapp/database/table/query_saved_table.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@UseMoor(
  tables: [Connections, DatabaseInfos, QuerySaveds],
  daos: [ConnectionDao, DatabaseInfoDao, QuerySavedDao],
)
class Database extends _$Database {
  static Database instance = Database._internal();

  ConnectionDao connectionDao;
  DatabaseInfoDao databaseInfoDao;
  QuerySavedDao querySavedDao;

  Database._internal() : super(_openConnection()) {
    connectionDao = ConnectionDao(this);
    databaseInfoDao = DatabaseInfoDao(this);
    querySavedDao = QuerySavedDao(this);
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (OpeningDetails details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}