import 'package:dio/dio.dart';

final String BASE_URL = 'https://n68jopqcs4.execute-api.us-east-1.amazonaws.com/dev';

var _dio = Dio();


Future postRequest({String endpoint, body}) {
  return _dio.post('$BASE_URL/$endpoint', data: body);
}