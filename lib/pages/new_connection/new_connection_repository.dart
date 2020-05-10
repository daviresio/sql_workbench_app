import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/error_model.dart';
import 'package:dbclientapp/network/dio_config.dart';
import 'package:dio/dio.dart';
import './new_connection_constants.dart';

class NewConnectionRepository {

  Future connectDB(Connection connection) async {
    ConnectionModel connectionModel = ConnectionModel.fromTable(connection);

    try {
      var result = await postRequest(
          endpoint: '/${databaseUrl[connection.vendor]}/database-info',
          body: connectionModel.toJson());
      print(result);
      return DatabaseInfoModel.fromJson(result.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw e.error;
      }
      if (e.type == DioErrorType.DEFAULT) {
        if (e.error.message == "") {
          throw e.error.osError.message;
        }
        if (e.error.source != null) {
          throw e.error.source;
        }
      }

      throw ErrorModel.fromJson(e.response.data).message;
    }
  }
}
