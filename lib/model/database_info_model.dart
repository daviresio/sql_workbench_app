
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/util/converter_util.dart';

class DatabaseInfoModel {
  List<dynamic> databases;
  List<dynamic> schemas;
  List<dynamic> tables;
  List<dynamic> views;
  List<dynamic> storeProcedures;
  List<dynamic> functions;
  String currentSchema;

  DatabaseInfoModel({this.databases, this.schemas, this.tables, this.views, this.storeProcedures, this.functions, this.currentSchema});

  factory DatabaseInfoModel.fromJson(Map<String, dynamic> json) {
    var dat = DatabaseInfoModel(
      databases: json['databases'] == null ? [] : json['databases'],
      schemas: json['schemas'] == null ? [] : json['schemas'],
      tables: json['tables'] == null ? [] : json['tables'],
      views: json['views'] == null ? [] : json['views'],
      storeProcedures: json['store_producers'] == null ? [] : json['store_producers'],
      functions: json['functions'] == null ? [] : json['functions'],
      currentSchema: json['current_schema']
    );
    return dat;
  }

  @override
  String toString() {
    return 'DatabaseInfoModel{databases: $databases, schemas: $schemas, tables: $tables, views: $views, storeProcedures: $storeProcedures, functions: $functions, currentSchema: $currentSchema}';
  }

  DatabaseInfo toTable() {

    DatabaseInfo dbInfo = DatabaseInfo(
      databases: ConverterUtil.listToString(databases),
      schemas: ConverterUtil.listToString(schemas),
      tables: ConverterUtil.listToString(tables),
      views: ConverterUtil.listToString(views),
      storeProcedures: ConverterUtil.listToString(storeProcedures),
      functions: ConverterUtil.listToString(functions),
    );

    return dbInfo;
  }


}