import 'package:moor/moor.dart';

@DataClassName('DatabaseInfo')
class DatabaseInfos extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get databases => text().nullable()();
  TextColumn get schemas => text().nullable()();
  TextColumn get tables => text().nullable()();
  TextColumn get views => text().nullable()();
  TextColumn get storeProcedures => text().named('store_procedures').nullable()();
  TextColumn get functions => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at').nullable()();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').nullable()();
}