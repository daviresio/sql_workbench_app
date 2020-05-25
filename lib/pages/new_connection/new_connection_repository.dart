import 'package:dbclientapp/database/database.dart';
import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/database_info_model.dart';
import 'package:dbclientapp/config/dio_config.dart';
import './new_connection_constants.dart';

class NewConnectionRepository {
  Future connectDB(Connection connection) async {
    try {
      ConnectionModel connectionModel = ConnectionModel.fromTable(connection);
      var result = await postRequest(
          endpoint: '/${databaseUrl[connection.vendor]}/database-info',
          body: connectionModel.toJson());
      return DatabaseInfoModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
