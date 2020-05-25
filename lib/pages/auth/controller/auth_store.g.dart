// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$countryGeolocationAtom = Atom(name: '_AuthStore.countryGeolocation');

  @override
  String get countryGeolocation {
    _$countryGeolocationAtom.context
        .enforceReadPolicy(_$countryGeolocationAtom);
    _$countryGeolocationAtom.reportObserved();
    return super.countryGeolocation;
  }

  @override
  set countryGeolocation(String value) {
    _$countryGeolocationAtom.context.conditionallyRunInAction(() {
      super.countryGeolocation = value;
      _$countryGeolocationAtom.reportChanged();
    }, _$countryGeolocationAtom, name: '${_$countryGeolocationAtom.name}_set');
  }

  final _$phoneNumberAtom = Atom(name: '_AuthStore.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.context.enforceReadPolicy(_$phoneNumberAtom);
    _$phoneNumberAtom.reportObserved();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.context.conditionallyRunInAction(() {
      super.phoneNumber = value;
      _$phoneNumberAtom.reportChanged();
    }, _$phoneNumberAtom, name: '${_$phoneNumberAtom.name}_set');
  }

  final _$smsCodeAtom = Atom(name: '_AuthStore.smsCode');

  @override
  String get smsCode {
    _$smsCodeAtom.context.enforceReadPolicy(_$smsCodeAtom);
    _$smsCodeAtom.reportObserved();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.context.conditionallyRunInAction(() {
      super.smsCode = value;
      _$smsCodeAtom.reportChanged();
    }, _$smsCodeAtom, name: '${_$smsCodeAtom.name}_set');
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  dynamic setCountryGeolocation(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setCountryGeolocation(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSmsCode(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setSmsCode(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'countryGeolocation: ${countryGeolocation.toString()},phoneNumber: ${phoneNumber.toString()},smsCode: ${smsCode.toString()}';
    return '{$string}';
  }
}
