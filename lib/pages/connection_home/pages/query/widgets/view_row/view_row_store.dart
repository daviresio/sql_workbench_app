import 'package:dbclientapp/model/query_response_model.dart';
import 'package:mobx/mobx.dart';

part 'view_row_store.g.dart';

class ViewRowStore = _ViewRowStore with _$ViewRowStore;

abstract class _ViewRowStore with Store {

  _ViewRowStore(Map<String, dynamic> values, List<TypesResponseQueryModel> typesInit) {

    setTypes(typesInit);

    Map<String, dynamic> originalValueTemp = {};

    if(values == null) {

      setEditMode(true);
      setIsNewRecord(true);

      items = {};
      //TODO esta inicializando todos como string vazia, mas o correto seria inicializar com o tipo correto
      types.forEach((e) {
        items.putIfAbsent(e.columnName, () => '');
        originalValueTemp.putIfAbsent(e.columnName, () => null);
      });

    } else {
      setItems(values);
    }
    //preciso saber quais vieram null para voltar null caso nao haja modificacao
    setOriginalValue(values ??= originalValueTemp);
  }

  @observable
  bool isNewRecord = false;

  @action
  void setIsNewRecord(bool value) {
    isNewRecord = value;
  }

  @observable
  bool editMode = false;

  @action
  void setEditMode(bool value) {
    editMode = value;
  }

  @observable
  Map<String, dynamic> items;

  @action
  void changeValue(String key, dynamic value) {
    items[key] = value;
  }

  @observable
  Map<String, dynamic> originalItems;

  @action
  void setOriginalValue(Map<String, dynamic> value) {
    originalItems = value;
  }

  @action
  void setItems(Map<String, dynamic> value) {
    items = value;
  }

  @observable
  List<TypesResponseQueryModel> types;

  @action
  void setTypes(List<TypesResponseQueryModel> value) {
    types = value;
  }


  getParsedValues() {
    Map<String, dynamic> parsedValues = Map();

    types.forEach((type) {
      var currentValue = items[type.columnName].toString().trim();
      var originalValue = originalItems[type.columnName];
      dynamic newValue;

      if(currentValue == 'null' || currentValue == '' && originalValue == null) {
        newValue = null;
      } else if(type.dataType == 'int') {
        newValue = int.parse(currentValue);
      } else if(type.dataType == 'numeric') {
        newValue = double.parse(currentValue);
      } else if(type.dataType == 'bool') {
        print(currentValue);

      } else {
        newValue = currentValue;
      }

      parsedValues.putIfAbsent(type.columnName, () => newValue);

    });

    return parsedValues;
  }

}