
class QueryResponseModel {
  final Map<String, dynamic> data;
  final List<TypesResponseQueryModel> types;

  QueryResponseModel({this.data, this.types});

  factory QueryResponseModel.fromJson(Map<String, dynamic> values, types) {
    return QueryResponseModel(
      data: values,
      types: List<TypesResponseQueryModel>.from(types.map((value) => TypesResponseQueryModel.fromJson(value)))
    );
  }

}

class TypesResponseQueryModel {
  final String columnName;
  final int columnIndex;
  final int tableId;
  final String dataType;

  TypesResponseQueryModel({this.columnName, this.columnIndex, this.tableId, this.dataType});

  factory TypesResponseQueryModel.fromJson(Map<String, dynamic> json) {
    return TypesResponseQueryModel(
      columnName: json['columnName'],
      columnIndex: json['columnIndex'],
      tableId: json['tableId'],
      dataType: json['dataType'],
    );
  }

  Map<String, dynamic> toJson() => {
    'columnName': columnName,
    'columnIndex': columnIndex,
    'tableId': tableId,
    'dataType': dataType,
  };

  @override
  String toString() {
    return 'TypesResponseQueryModel{columnName: $columnName, columnIndex: $columnIndex, tableId: $tableId, dataType: $dataType}';
  }


}