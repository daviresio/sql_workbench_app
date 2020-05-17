import 'package:dbclientapp/model/query_response_model.dart';
import 'package:mobx/mobx.dart';

part 'view_row_store.g.dart';

class ViewRowStore = _ViewRowStore with _$ViewRowStore;

abstract class _ViewRowStore with Store {

  _ViewRowStore(Map<String, dynamic> values, List<TypesResponseQueryModel> typesInit) {

    setTypes(typesInit);

    if(values == null) {

      setEditMode(true);
      setIsNewRecord(true);

      items = {};
      //TODO esta inicializando todos como string vazia, mas o correto seria inicializar com o tipo correto
      types.forEach((e) {
        items.putIfAbsent(e.columnName, () => '');
      });

    } else {
      setItems(values);
    }
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

}