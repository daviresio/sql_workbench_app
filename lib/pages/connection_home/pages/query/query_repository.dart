import 'package:dbclientapp/model/delete_query_model.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';
import 'package:dbclientapp/config/dio_config.dart';
import 'package:dio/dio.dart';

class QueryRepository {

  Future<List<QueryResponseModel>> execQuery(QueryModel queryModel) async {
    try {
      Response<dynamic> result = await postRequest(endpoint: '/postgres/query', body: queryModel.toJson());
      if(result.data == null) return null;

      var data = List<QueryResponseModel>.from(result.data['data'].map((value) => QueryResponseModel.fromJson(value, result.data['types'])));
      print(data);
      return data;
    } catch (e) {
      throw e.toString();
    }

  }

  Future<dynamic> deleteRecord(DeleteQueryModel deleteQueryModel) async {
    try {
      Response<dynamic> result = await postRequest(endpoint: '/postgres/delete', body: deleteQueryModel.toJson());
      return true;
    } catch (e) {
      throw e.toString();
    }

  }

  Future<dynamic> updateRecord(DeleteQueryModel deleteQueryModel) async {
    try {
      Response<dynamic> result = await postRequest(endpoint: '/postgres/update', body: deleteQueryModel.toJson());
     print(result);
     print(result);
      return true;
    } catch (e) {
      throw e.toString();
    }

  }

}