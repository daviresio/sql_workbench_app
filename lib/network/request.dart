import 'package:dbclientapp/config/dio_config.dart';
import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/pages/new_connection/new_connection_constants.dart';
import 'package:flutter/material.dart';

class Request {

  Future connectDB(Connection connection, BuildContext context) async {
    try {
      ConnectionModel connectionModel = ConnectionModel.fromTable(connection);
      var result = await postRequest(endpoint: '/${databaseUrl[connection.vendor]}/database-info', body: connectionModel.toJson(), context: context);
      return DatabaseInfoModel.fromJson(result.data);
    } catch (e) {
      throw e.toString();
    }
  }

}