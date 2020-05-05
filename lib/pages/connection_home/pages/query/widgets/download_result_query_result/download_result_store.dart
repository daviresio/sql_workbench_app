import 'package:mobx/mobx.dart';

part 'download_result_store.g.dart';

class DownloadResultStore = _DownloadResultStore with _$DownloadResultStore;

abstract class _DownloadResultStore with Store {

  @observable
  bool isCsvSelected = true;

  @action
  void setIsCsvSelected(bool value) {
    isCsvSelected = value;
  }

  @observable
  bool isDownloadSelected = true;

  @action
  void setIsDownloadSelected(bool value) {
    isDownloadSelected = value;
  }

}