import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthSmsStepOne extends StatefulWidget {
  @override
  _AuthSmsStepOneState createState() => _AuthSmsStepOneState();
}

class _AuthSmsStepOneState extends State<AuthSmsStepOne> {

  String verificationId;

  Future<void> sendCodeToPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential user) {
      print(user.toString());
    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
      print(authException.toString());
    };

    final PhoneCodeSent phoneCodeSent = (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      print(verificationId);
    };

    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout = (String verificationId) {
      this.verificationId = verificationId;
      print(verificationId);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: null,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout
    );
    
  }



  void signInWithPhoneNumber(AuthCredential credential) async {
    try {
      AuthResult authResult = await FirebaseAuth.instance.signInWithCredential(credential);
    } catch(e) {
      throw e;
    }
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //TODO colocar a imagem aqui no lugar
              Container(
                width: 220.0,
                height: 220.0,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(200.0)
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Registration',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Enter your phone number to verify your account',
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                  ),
                ],
              ),
              Card(
                elevation: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      InternationalPhoneNumberInput(
                        initialValue: PhoneNumber(isoCode: 'US'),
                        inputBorder: OutlineInputBorder(),
                        onInputChanged: (PhoneNumber phoneNumber) {

                        },
                        onInputValidated: (bool value) {

                        },
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          color: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
