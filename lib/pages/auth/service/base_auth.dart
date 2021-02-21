import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

  Future<String> sendCodeToPhoneNumber(String phoneNumber, Function getVerificationId, Function getErrorToThrow);

  Future<String> mailSignIn(String email, String password);

  Future<String> anonimousSignIn();

  Future<String> signUp(String email, String password);

  Future<User> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<bool> isLoged();

}

class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> sendCodeToPhoneNumber(String phoneNumber, Function getVerificationId, Function getErrorToThrow) async {
    String idVerification;

    final PhoneVerificationCompleted verificationCompleted = (AuthCredential user) async {
      return user;
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) async {
      getErrorToThrow(authException.message);
    };

    final PhoneCodeSent phoneCodeSent = (String verificationId, [int forceResendingToken]) async {
      idVerification = verificationId;
      getVerificationId(verificationId);
    };

    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout = (String verificationId) async {
      idVerification = verificationId;
      getVerificationId(verificationId);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
    );

    return idVerification;
  }

  @override
  Future<String> anonimousSignIn() async {
    UserCredential authResult = await FirebaseAuth.instance.signInAnonymously();
    return authResult.user.uid;
  }

  @override
  Future<String> mailSignIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
    User user = result.user;
    return user.uid;
  }

  @override
  Future<String> signUp(String email, String password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = result.user;
    return user.uid;
  }

  @override
  Future<User> getCurrentUser() async {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    User user = _firebaseAuth.currentUser;
    await user.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerified() async {
    User user = _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<bool> isLoged() async {
    User user = _firebaseAuth.currentUser;
    return user != null;
  }

}