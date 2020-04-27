import 'package:dbclientapp/model/error_model.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/network/dio_config.dart';
import 'package:dio/dio.dart';

class QueryRepository {

  Future<List<dynamic>> execQuery(QueryModel queryModel) async {
    try {
      Response<dynamic> result = await postRequest(endpoint: '/postgres/query', body: queryModel.toJson());
      var resData = (result.data ??= []);
      var data = resData.map((value) => Map<String, dynamic>.from(value)).toList();
      return data;
    } on DioError catch(e) {
      print(e);
      if(e.type == DioErrorType.DEFAULT) {
        throw e.error.source;
      }

      throw ErrorModel.fromJson(e.response.data).message;
    }

  }

}