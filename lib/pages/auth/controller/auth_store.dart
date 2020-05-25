import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String countryGeolocation;

  @action
  setCountryGeolocation(String value) {
    countryGeolocation = value.substring(value.length - 2);
  }

  @observable
  String phoneNumber;

  @action
  setPhoneNumber(String value) {
    phoneNumber = value;
  }

  @observable
  String smsCode = '';

  @action
  setSmsCode(String value) {
    smsCode = value;
  }

}
