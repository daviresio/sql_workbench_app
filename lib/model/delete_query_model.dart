import 'package:dbclientapp/model/connection_model.dart';
import 'package:dbclientapp/model/query_response_model.dart';

class DeleteQueryModel {
  ConnectionModel connection;
  Map<String, dynamic> data;
  List<TypesResponseQueryModel> types;

  DeleteQueryModel({this.types, this.data, this.connection});

  Map<String, dynamic> toJson () {
    var typesTemp = types.map((type) => type.toJson());
    var typesParsed = List<Map<String, dynamic>>.from(typesTemp);

    return {
      'connection': connection.toJson(),
      'data': data,
      'types': typesParsed,
    };
  }

}