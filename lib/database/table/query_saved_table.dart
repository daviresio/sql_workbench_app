import 'package:moor/moor.dart';

@DataClassName('QuerySaved')
class QuerySaveds extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get query => text().withDefault(Constant('')).nullable()();
  BoolColumn get saved => boolean().withDefault(Constant(false)).nullable()();
  IntColumn get databaseInfoId => integer().named('database_info_id').nullable()();
  DateTimeColumn get lastExecution => dateTime().named('last_execution').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').nullable()();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').nullable()();
}