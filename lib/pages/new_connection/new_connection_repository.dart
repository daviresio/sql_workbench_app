import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/error_model.dart';
import 'package:dbclientapp/network/dio_config.dart';
import 'package:dio/dio.dart';

class NewConnectionRepository {

  Future connectDB(Connection connection) async {
    ConnectionModel connectionModel = ConnectionModel.fromTable(connection);

    try {
      var result = await postRequest(
          endpoint: '/postgres/database-info', body: connectionModel.toJson());
      return DatabaseInfoModel.fromJson(result.data);
    } on DioError catch (e) {
      print(e.error.osError);
      if (e.type == DioErrorType.DEFAULT) {
        if(e.error.source != null) {
          throw e.error.source;
        } else if(e.error.osError != null) {
          throw e.error.osError;
        }
      }

      throw ErrorModel.fromJson(e.response.data).message;
    }
  }

}



//ConnectionModel connectionModel = ConnectionModel(
//    host: 'postgres.clflap3onosk.us-east-2.rds.amazonaws.com',
//    user: 'postgres',
//    password: 'toqweb18',
//    databaseName: 'ToqWeb',
//    port: '5432'
//);