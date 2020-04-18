import 'package:moor/moor.dart';

@DataClassName('Connection')
class Connections extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get vendor => text().nullable()();
  TextColumn get host => text().nullable()();
  TextColumn get port => text().nullable()();
  TextColumn get databaseName => text().named('database_name').nullable()();
  TextColumn get schema => text().nullable()();
  TextColumn get user => text().nullable()();
  TextColumn get password => text().nullable()();
  BoolColumn get ssh => boolean().withDefault(Constant(false)).nullable()();
  IntColumn get databaseInfoId => integer().named('database_info_id')();
  DateTimeColumn get createdAt => dateTime().named('created_at').nullable()();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').nullable()();

}