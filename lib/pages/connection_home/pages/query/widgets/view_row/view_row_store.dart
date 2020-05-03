import 'package:mobx/mobx.dart';

part 'view_row_store.g.dart';

class ViewRowStore = _ViewRowStore with _$ViewRowStore;

abstract class _ViewRowStore with Store {

  _ViewRowStore(Map<String, dynamic> value) {
    setItems(value);
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

}