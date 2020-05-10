import 'package:dbclientapp/model/error_model.dart';
import 'package:dio/dio.dart';

//final String BASE_URL = 'https://1vhggv59f4.execute-api.us-east-1.amazonaws.com/dev';
final String BASE_URL = 'http://10.0.3.2:3000/dev';

BaseOptions _baseOptions = BaseOptions(
  connectTimeout: 10 * 1000,
);

var _dio = Dio(_baseOptions);

Future<dynamic> postRequest({String endpoint, body}) async {
  try {
    var result = await _dio.post('$BASE_URL$endpoint', data: body);
    return result;
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
