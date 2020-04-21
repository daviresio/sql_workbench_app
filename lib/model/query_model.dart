import 'package:dbclientapp/model/connection_model.dart';

class QueryModel {
  String query;
  ConnectionModel connection;

  QueryModel({this.query, this.connection});

  Map<String, dynamic> toJson ()=> {
    'query': query,
    'connection': connection.toJson(),
  };

}