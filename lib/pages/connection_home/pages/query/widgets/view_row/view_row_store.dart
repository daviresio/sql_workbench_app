import 'package:mobx/mobx.dart';

part 'view_row_store.g.dart';

class ViewRowStore = _ViewRowStore with _$ViewRowStore;

abstract class _ViewRowStore with Store {

  _ViewRowStore(Map<String, dynamic> value) {
    setItems(value);
  }

  @observable
  bool editMode = true;

  @action
  void setFormDisabled(bool value) {
    editMode = value;
  }

  @observable
  Map<String, dynamic> items;

  @action
  void changeValue(dynamic value, String key) {
    items[key] = value;
  }

  @action
  void setItems(Map<String, dynamic> value) {
    items = value;
  }

}