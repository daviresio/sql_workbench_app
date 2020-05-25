import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

  Future<String> sendCodeToPhoneNumber(String phoneNumber, Function getVerificationId, Function getErrorToThrow);

  Future<String> mailSignIn(String email, String password);

  Future<String> anonimousSignIn();

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

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

    final PhoneVerificationFailed verificationFailed = (AuthException authException) async {
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
    AuthResult authResult = await FirebaseAuth.instance.signInAnonymously();
    return authResult.user.uid;
  }

  @override
  Future<String> mailSignIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    await user.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  @override
  Future<bool> isLoged() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null;
  }

}