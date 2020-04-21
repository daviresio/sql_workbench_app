import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/model/error_model.dart';
import 'package:dbclientapp/network/dio_config.dart';

class NewConnectionRepository {

  Future connectDB(Connection connection) async {
    ConnectionModel connectionModel = ConnectionModel.fromTable(connection);

    try {
      var result = await postRequest(endpoint: '/postgres/database-info', body: connectionModel.toJson());
      return DatabaseInfoModel.fromJson(result.data);
    } catch(e) {
      print(ErrorModel.fromJson(e.response.data).message);
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