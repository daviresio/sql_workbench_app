import 'package:dbclientapp/model/delete_query_model.dart';
import 'package:dbclientapp/model/query_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';
import 'package:dbclientapp/config/dio_config.dart';
import 'package:dio/dio.dart';

class QueryRepository {

  Future<List<dynamic>> execQuery(QueryModel queryModel) async {
    try {
      Response<dynamic> result = await postRequest(endpoint: '/postgres/query', body: queryModel.toJson());
      if(result.data == null) return null;

      return List<dynamic>.from([result.data['data'], result.data['types'].map((value) => TypesResponseQueryModel.fromJson(value))]);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteRecord(DeleteQueryModel deleteQueryModel) async {
    try {
      Response<dynamic> result = await postRequest(endpoint: '/postgres/delete', body: deleteQueryModel.toJson());
      return true;
    } catch (e) {
      rethrow;
    }

  }

  Future<dynamic> updateRecord(DeleteQueryModel deleteQueryModel) async {
    try {
      print(deleteQueryModel.toString());
      Response<dynamic> result = await postRequest(endpoint: '/postgres/update', body: deleteQueryModel.toJson());
     print(result);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> saveRecord(DeleteQueryModel deleteQueryModel) async {
    try {
      print(deleteQueryModel.toString());
      Response<dynamic> result = await postRequest(endpoint: '/postgres/update', body: deleteQueryModel.toJson());
     print(result);
      return true;
    } catch (e) {
      rethrow;
    }
  }

}