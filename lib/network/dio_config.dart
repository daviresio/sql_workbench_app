import 'package:dio/dio.dart';

//final String BASE_URL = 'https://1vhggv59f4.execute-api.us-east-1.amazonaws.com/dev';
final String BASE_URL = 'http://10.0.3.2:3000/dev';

BaseOptions _baseOptions = BaseOptions(
  connectTimeout: 10 * 1000,
);

var _dio = Dio(_baseOptions);


Future postRequest({String endpoint, body}) {
  return _dio.post('$BASE_URL$endpoint', data: body);
}