import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/error_model.dart';
import 'package:dbclientapp/network/dio_config.dart';

class NewConnectionRepository {

  Future testConnection(Connection connection) async {
    ConnectionModel connectionModel = ConnectionModel.fromTable(connection);
    try {
      var result = await postRequest(endpoint: '/load-database-info/postgres', body: connectionModel.toJson());
      return DatabaseInfoModel.fromJson(result.data);
    } catch(e) {
      print(e);
      print(ErrorModel.fromJson(e.response.data).message);
      throw ErrorModel.fromJson(e.response.data).message;
    }
  }

}