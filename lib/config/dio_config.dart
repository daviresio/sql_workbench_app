import 'package:dbclientapp/widgets/dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

final String BASE_URL = 'https://1vhggv59f4.execute-api.us-east-1.amazonaws.com/dev';
//final String BASE_URL = 'http://10.0.3.2:3000/dev';

BaseOptions _baseOptions = BaseOptions(
  connectTimeout: 10 * 1000,
);

var _dio = Dio(_baseOptions);

Future<dynamic> postRequest({String endpoint, body, BuildContext context}) async {
  try {
    if(context != null) {
      Dialogs.showLoadingDialog(context, null);
    }

    var result = await _dio.post('$BASE_URL$endpoint', data: body).whenComplete(() {
      if(context != null) {
        Navigator.of(context).pop();
      }
    });
    return result;
  } on DioError catch (e) {
    String erro;
    if(e.type == DioErrorType.CONNECT_TIMEOUT) {
      erro = e.error;
    } else if(e.type == DioErrorType.DEFAULT) {
      if (e.error.message == "") {
        erro = e.error.osError.message;
      } else if(e.error.source != null) {
        erro = e.error.source;
      }
    } else if(e.type == DioErrorType.RESPONSE) {
      if(e.response != null && e.response.data != null) {
        erro = e.response.data['message'];
      }
      if(erro == null) {
        erro = e.response.statusMessage;
      }
    }

    if(context != null) {
      Dialogs.errorDialog(erro ??= 'A error ocurred', context);
    }

    throw erro;
  }
}
