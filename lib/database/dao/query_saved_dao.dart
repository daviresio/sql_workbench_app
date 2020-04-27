import 'package:dbclientapp/database/table/query_saved_table.dart';
import 'package:moor/moor.dart';

import '../database.dart';

part 'query_saved_dao.g.dart';

@UseDao(tables: [QuerySaveds])
class QuerySavedDao extends DatabaseAccessor<Database> with _$QuerySavedDaoMixin {

  final Database db;

  QuerySavedDao(this.db) : super(db);

  Future<QuerySaved> find(int id) => (select(querySaveds)..where((t) => t.id.equals(id))).getSingle();

  Stream<List<QuerySaved>> list() => select(querySaveds).watch();

  Stream<List<QuerySaved>> listHistory(int databaseInfoId) => (select(querySaveds)..where((t) => t.saved.equals(false) & t.databaseInfoId.equals(databaseInfoId))).watch();

  Stream<List<QuerySaved>> listFavorite(int databaseInfoId) => (select(querySaveds)..where((t) => t.saved.equals(true) & t.databaseInfoId.equals(databaseInfoId))).watch();

  Future add(QuerySaved querySaved) => into(querySaveds).insert(querySaved.copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now()));

  Future edit(QuerySaved querySaved) => update(querySaveds).replace(querySaved.copyWith(updatedAt: DateTime.now()));

  Future remove(id) => (delete(querySaveds)..where((t) => t.id.equals(id))).go();

}