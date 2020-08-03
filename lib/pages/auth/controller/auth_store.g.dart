// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$countryGeolocationAtom = Atom(name: '_AuthStore.countryGeolocation');

  @override
  String get countryGeolocation {
    _$countryGeolocationAtom.reportRead();
    return super.countryGeolocation;
  }

  @override
  set countryGeolocation(String value) {
    _$countryGeolocationAtom.reportWrite(value, super.countryGeolocation, () {
      super.countryGeolocation = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_AuthStore.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$smsCodeAtom = Atom(name: '_AuthStore.smsCode');

  @override
  String get smsCode {
    _$smsCodeAtom.reportRead();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.reportWrite(value, super.smsCode, () {
      super.smsCode = value;
    });
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  dynamic setCountryGeolocation(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setCountryGeolocation');
    try {
      return super.setCountryGeolocation(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSmsCode(String value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setSmsCode');
    try {
      return super.setSmsCode(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countryGeolocation: ${countryGeolocation},
phoneNumber: ${phoneNumber},
smsCode: ${smsCode}
    ''';
  }
}
